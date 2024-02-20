class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
    @grand_total_score = session[:grand_total_score] || 0
  end
end
