require 'rspec'
require_relative 'hangman_game_setup_spec'

class Game
  attr_reader :players

  def initialize(players, word)
    @players = players
    @word = word
    @guessed_letters = []
    @unguessed_letters = ("a" .. "z").to_a
  end

  def word
    @word
  end

  def blacked
    regex = "[" + @unguessed_letters.join() + "]"
    @word.gsub(Regexp.new(regex),"_")
  end

  def guess_letter(letter)
    letter.downcase!
    
    if @guessed_letters.include? letter
      true
    else 
      @guessed_letters << letter
      @unguessed_letters = @unguessed_letters - [letter]
      false
    end
  end

  def guessed_letters
    @guessed_letters
  end

  def check_word_for(letter)
    @word.include? letter
  end 
  
  def correct_word?(word)
    @word == word
  end

  def select_player
    player = @players.shift
    @players.push player
    player
  end


end

