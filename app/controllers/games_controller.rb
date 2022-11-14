require 'open-uri'

class GamesController < ApplicationController

    def new
        @letters = ("a".."z").to_a.sample(10)
    end

    def score
        @letters = params[:letters]
        @word = params[:word].split("")
        array = []
        @word.each do |letter|
            array << @letters.slice!(letter)
        end
        url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
        response = URI.open(url)
        json = JSON.parse(response.read)
        # check = json["found"]
        raise
        if array == @word
            check == true ? @result = "It's a valid word!" : @result = "It's not a valid word!"
        else
            @result = "Sorry, it's not part of the grid!"
        end
    end
end
