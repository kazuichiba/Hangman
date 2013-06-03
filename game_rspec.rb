require  'rspec'
require_relative 'game'

describe Game do
  describe "the number of players" do
    it "allows the amount of players to be set" do
      game = Game.new(1)
      expect(game.player_count).to eql(1)
    end

    describe "allows up to five players" do
      it "should allow five players" do
        game = Game.new(5)
        expect(game.has_valid_player_count?).to be_true
      end

      it "shouldnt allow 6 players" do
        game = Game.new(6)
        expect(game.has_valid_player_count?).to be_false
      end
      it "shouldnt allow zero players" do
        game = Game.new(0)
        expect(game.has_valid_player_count?).to be_false
      end
    end
  end
end
