class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters]

    if included?
      if english_word?(@word)
        @result = "well done! #{@word} is a valid"
      else
        @result = "#{@word} is not an english word"
      end
    else
      @result = "#{@word} is not in the grid"
    end
  end

  def included?
    @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end
end
