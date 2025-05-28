require_relative 'lib/game'

def main
  tic_tac_toe = Game.new
  tic_tac_toe.welcome_banner
  tic_tac_toe.create_players

  loop do
    if tic_tac_toe.game_ended
      if tic_tac_toe.check_for_draw
        puts "Game over! It's a draw..."
      else
        puts "Game over! #{tic_tac_toe.who_won?} wins!"
      end
      break
    end
    tic_tac_toe.play_round
  end
end

main
