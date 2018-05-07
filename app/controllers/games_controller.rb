require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
   #  @letters = []
   #  10.times do
   #    @letters << ("a".."z").to_a.sample
   # end
   @letters = Array.new(10) { ("a".."z").to_a.sample }
  end

  def score
    raise
    word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_checked = open(url).read
    result = JSON.parse(word_checked)
    if result['found']
      @message = "Success!!"
    else
      @message = "Sorry, #{word} is not an English word!!"
    end
  end
end
