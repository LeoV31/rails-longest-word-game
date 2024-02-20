require 'open-uri'
require 'json'

class ScoresController < ApplicationController
  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:question]}"
    user_serialized = URI.open(url).read
    session[:scores] ||= []
    if JSON.parse(user_serialized)["found"] == true
      if params[:question].upcase.chars.tally.all? { |char, count| params[:letters].chars.tally[char] && params[:letters].chars.tally[char] >= count}
        @message = "Well done!"
        session[:scores] << params[:question].length
      else
        @message = "not in the grid"
      end
    else
      @message = "not an english word"
    end
    @message
    @grand_total_score = session[:scores].sum
    session[:grand_total_score] = @grand_total_score
  end
end
