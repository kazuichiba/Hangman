require_relative 'hangman_game_setup'
require_relative 'hangman_game'


game_setup = GameSetup.new(0)

# get player count
while game_setup.has_valid_player_count? == false
  puts "enter 1-5"
  player_count = gets.chomp.to_i
  game_setup.change_player_count(player_count)
end

# get unique names
while game_setup.start_game? == false
  puts "Add player name:"
  player_name = gets.chomp
  game_setup.add_player(player_name)
  puts "Current Player List #{game_setup.players}"
end

shuffled_players_array_from_game_setup = game_setup.shuffled_players
random_word_from_game_setup = game_setup.random_word
random_word_from_game_setup = "cat"
game = Game.new(shuffled_players_array_from_game_setup, random_word_from_game_setup)


puts "Hey just to be clear these are the players that will start now #{game.players}"


# THIS IS the game LOOP
game_in_progress = true

while game_in_progress

  current_player = game.select_player

  puts "Hey #{current_player} you are up! Input a letter to guess or ! if you want to guess the word"
  puts game.blacked.split(//).join(" ")

  guess = true
  guess_word = "!"
  
  while guess 
    if guess_word == gets.chomp
      puts "What is your guess?"
      answer = gets.chomp
      if game.correct_word?(answer)
        puts "Your guess is Correct! #{current_player} You win!"
        break
      else 
        puts "Your are incorrect! #{current_player}"
        break
      end
    else
      break
    end
  end
  guess = ""
  
  while guess.length != 1
    guess = gets.chomp
    game.guess_letter(guess)

    if guess.length == 1
      if game.check_word_for(guess)
        puts "hey you're right! #{guess} was in the word!" 
      end
        else
          puts "nope! #{guess} was not in the word"
        end
      end
    end
  

