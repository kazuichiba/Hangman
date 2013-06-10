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
    it "allows incorrect words to be guessed" do
      correct_word = 'car'
      expect(game.correct_word?(correct_word)).to be_true
    end
    
    it "allows correct words to be guessed" do
      incorrect_word = 'boat'
      expect(game.correct_word?(incorrect_word)).to be_false
    end
  end

  describe 'player turn' do
    it 'returns the first player and cycles through' do
      expect(game.select_player).to eql("kaz")
      expect(game.players).to include("kaz")
      expect(game.select_player).to eql("jason")
    end
  end
end