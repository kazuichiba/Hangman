require_relative 'hangman_game_setup'
require_relative 'hangman_game'



puts "how many players?"
player_count = gets.chomp.to_i

game_setup = GameSetup.new(player_count)

while game_setup.has_valid_player_count? == false
  puts "enter 1-5"
  player_count = gets.chomp.to_i
  game_setup = GameSetup.new(player_count)
  if game_setup.has_valid_player_count? == true
    break
  end
end

x= 1
while player_count >= x
  puts "Player#{x} name:"
  player_name = gets.chomp
  unless game_setup.add_player(player_name) 
    puts "Player#{x} please choose a different name."
    player_name = gets.chomp
    game_setup.add_player(player_name)
  end
x += 1
end

random_words = ["cook","dog","cat","pool","beer","walk"]
word = random_words.shuffle.slice(1)
@unguessed_letters = ("a" .. "z").to_a
@guessed_letters = []
game = Game.new(word)

puts "#{players[0]} you go first."
puts game.blacked
puts "What letter would you like to guess?"
letter = gets.chomp
game.guess_letter(letter)
game.guessed_letters
game.check_word_for(letter)
puts game.blacked
puts "What letter would you like to guess?"
letter = gets.chomp

  