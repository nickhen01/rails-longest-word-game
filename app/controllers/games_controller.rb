require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @all_letters = ('A'..'Z').to_a
    @letters = []
    10.times do
      @letters << @all_letters.sample(1)
    end
    @letters
  end

  def score
    @word = params["word"]
    @letters = params["letters"].chars
    @word_check = true

    @word.upcase.chars.each do |letter|
      @word_check = false if @word.upcase.count(letter) > @letters.count(letter)
    end
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    var_1 = JSON.parse(open(url).read)
    @word_found = var_1["found"]
  end
end
