class GameSetup
  attr_reader :player_count, :players

  def initialize(player_count)
    @player_count = player_count
    @players = []
    @random_words = ["cook","dog","cat","pool","beer","walk"]
  end

  def has_valid_player_count?
    player_count <= 5 && player_count > 0
  end

  def add_player(player_name)
    #check if player is in array
    if(@players.include? player_name)
      # do nothing
    else
      #then add if they are not
      @players << player_name
    end
  end

  def shuffled_players
    @players.shuffle!
  end

  def random_word
    @random_words.shuffle.slice(1)
  end
  
  def random_words
    @random_words
  end

  def start_game?
    @players.length == @player_count
  end

  def change_player_count(new_count)
    @player_count = new_count
  end
end
