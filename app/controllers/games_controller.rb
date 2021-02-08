require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    alphabet = ('a'..'z').to_a
    @letters = []
    @letters.push(alphabet.sample) while @letters.length < 10
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:new]}"
    checking_att = open(url).read
    unless params[:new].chars.all? { |letter| params[:new].count(letter) <= params[:letters].count(letter) }
      return @result = "Sorry but TEST can't be build out of #{params[:letters]}"
    end
    if JSON.parse(checking_att)["found"] == false
      @result = "Sorry but #{params[:new]} does not seem to be a valid English word..."
    else @result = "Congratulation #{params[:new]} is a valid English word"
    end
    @score = params[:new].length
  end
end
