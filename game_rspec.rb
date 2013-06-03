require  'rspec'
require_relative 'game'

describe Game do
  describe "the number of players" do
    it "accepts an integer amount of players" do
      game = Game.new(1)
      expect(game.player_count).to eql(1)
    end

    it "allows up to five players"

  end
end
