class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  grid = ('A'..'Z').to_a.sample(10)
end
