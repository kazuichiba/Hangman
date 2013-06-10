require 'rspec'
require_relative 'hangman_game_setup'

describe GameSetup do
  describe "the number of players" do
    it "allows the amount of players to be set" do
      game_setup = GameSetup.new(1)
      expect(game_setup.player_count).to eql(1)
    end
    
    describe "allows up to 5 players" do
      it "should allow five players" do
        game_setup = GameSetup.new(5)
        expect(game_setup.has_valid_player_count?).to be_true
      end

      it "shouldnt allow 6 players" do
        game_setup = GameSetup.new(6)
        expect(game_setup.has_valid_player_count?).to be_false
      end
      it "shouldnt allow 0 players" do
        game_setup = GameSetup.new(0)
        expect(game_setup.has_valid_player_count?).to be_false
      end
    end
  end
  describe "adding players to a game" do
    it "allows name to be entered" do
      game_setup = GameSetup.new(1)
      game_setup.add_player("kaz")
      expect(game_setup.players).to include("kaz")
    end
  end

    describe "check is the game is ready to play" do
      it "returns false if player names does not equal player count" do
        game_setup = GameSetup.new(1)
        expect(game_setup.start_game?).to be_false
    end
  
    it "returns true if player name is equal to the player count" do
      game_setup = GameSetup.new(1)
      game_setup.add_player("kaz")
      expect(game_setup.start_game?).to be_true
    end
  end
  
  describe "checks for the uniquness of all players" do
    it "makes sure that players names are unique" do
      game_setup = GameSetup.new(2)
      
      # try to add name twice
      game_setup.add_player("john")
      game_setup.add_player("john")

      # make sure name is there AND that it is only there once
      expect(game_setup.players).to include("john")
      expect(game_setup.players.length).to eql(1)
    end
  end


  describe "picks a random" do
    it "selects a random work from an array" do
      game_setup = GameSetup.new(2)
      word = game_setup.random_word
      expect(game_setup.random_words).to include(word)
    end
  end
end

