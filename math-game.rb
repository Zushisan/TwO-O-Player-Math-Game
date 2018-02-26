require './player'
require './question'
require './current_player'

player_1 = Player.new('Romain')
player_2 = Player.new('Zushi')
switch_player = CurrentPlayer.new(player_1.name, player_2.name) # We always work with player_1

loop do
  if (player_2.life == 0)
    puts "#{player_1.name} won!! With #{player_1.life} life(s) left!"
    break
  end

  # ask the question and check res
  question = Question.new
  puts "#{player_1.name}: "
  res = question.question_output
  if res[0]
    puts "Correct !"
  else
    puts "Incorrect, #{player_1.name} you lose 1 life. The result was #{res[1]}"
    player_1.lose_life
    puts "#{player_1.name}: #{player_1.life}"
  end

  # toggle to switch between players
  player_array = switch_player.toggle(player_1, player_2)
  player_1 = player_array[0]
  player_2 = player_array[1]

end