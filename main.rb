require_relative 'lib/game'

def main
  tic_tac_toe = Game.new
  tic_tac_toe.welcome_banner
  tic_tac_toe.create_players

  loop do
    if tic_tac_toe.game_ended
      puts 'Game Over!'
      break
    end
    tic_tac_toe.play_round
  end
end

main
