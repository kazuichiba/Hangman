class Game
  attr_reader :player_count
  
  def initialize(player_count)
    @player_count = player_count
  end

  def has_valid_player_count?
    player_count <= 5 && player_count > 0
  end
end
