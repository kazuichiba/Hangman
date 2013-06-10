require 'rspec'
require_relative 'hangman_game_setup'
require_relative 'hangman_game'




describe Game do   
  let!(:game) { Game.new(['kaz','jason'], "car")}
  
  describe "game initialization" do
    it "selects player array" do
      expect(game.players).to include('jason')
    end
    
    it "grabs a word" do
      expect(game.word).to eql("car")
    end
  end

  describe "create blacked out word to hide letter" do
    it "returns a fully blacked out word" do
      expect(game.blacked).to eql("___")
    end
  end

  describe "guessed letters" do
    it "stores all guessed letters" do
      game.guess_letter("a")
      expect(game.guessed_letters).to include("a")
    end

    it "stores all guessed letters as lowercase" do
      game.guess_letter("A")
      expect(game.guessed_letters).to include("a") 
    end
  end
  
  it "says that the guessed letter is not in the word" do
    expect(game.check_word_for("w")).to be_false
  end

  it "says that the guessed letter is in the word" do
    expect(game.check_word_for("c")).to be_true
  end

  it "fills in the guessed letter everytime it occurs in the word" do
    game.guess_letter("c")
    expect(game.blacked).to include("c__")
  end
  describe "guessing the word" do
    it "allows to guess word" do
      expect(game.guess_word).to eql("!")
    end
    it "verifies that the word is correct" do
      expect(game.solved?).to be_true
    end
  end
end