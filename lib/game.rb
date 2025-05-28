require_relative 'player'
require_relative 'board'

class Game
  def initialize
    @turn = 1
    @game_board = Board.new
  end

  def welcome_banner
    puts '---------------'
    puts '  TIC TAC TOE  '
    puts '---------------'
  end

  def switch_turn
    @turn = 1 - @turn
    @current_player = @turn.zero? ? @player_one : @player_two
  end

  def display_board
    puts
    @game_board.display
    puts
  end

  def valid_move?(row, col)
    return false unless row.is_a?(Integer) && col.is_a?(Integer)
    return false unless row.between?(0, 2) && col.between?(0, 2)
    return false unless @game_board.grid[row][col] == ' '

    true
  end

  def prompt_player_name
    puts
    puts "Enter a name for player #{@turn.zero? ? 'one' : 'two'}"
    print '>'
    @player_name = gets.chomp
    @player_one = Player.new(@player_name, 'X') if @turn.zero?
    @player_two = Player.new(@player_name, 'O') unless @turn.zero?
  end

  def prompt_player_move # rubocop:disable Metrics/MethodLength
    puts "Your turn #{@current_player.name}! Where would you like to place your piece?"
    display_board
    loop do
      print '>'
      @player_input = gets.chomp
      @row, @col = @player_input.split(',').map(&:to_i)

      if valid_move?(@row, @col)
        @game_board.place(@current_player.piece, @row, @col)
        break
      else
        puts 'Invalid move, try again.'
      end
    end
    display_board
  end

  def create_players
    switch_turn
    prompt_player_name
    switch_turn
    prompt_player_name
    puts
    puts "Player one, your name is #{@player_one.name} and your piece is #{@player_one.piece}!"
    puts "Player two, your name is #{@player_two.name} and your piece is #{@player_two.piece}!"
    puts
  end

  def check_rows_for(piece)
    @game_board.grid.any? { |row| row.all?(piece) }
  end

  def check_columns_for(piece)
    first_column = @game_board.grid.map { |row| row[0] }
    second_column = @game_board.grid.map { |row| row[1] }
    third_column = @game_board.grid.map { |row| row [2] }

    return true if first_column.all?(piece)
    return true if second_column.all?(piece)
    return true if third_column.all?(piece)

    false
  end

  def check_cross_for(piece)
    left_to_right = @game_board.grid.map.with_index { |row, index| row[index] }
    right_to_left = @game_board.grid.map.with_index { |row, index| row[2 - index] }

    return true if left_to_right.all?(piece)
    return true if right_to_left.all?(piece)

    false
  end

  def check_for_draw
    @game_board.grid.each { |row| return false if row.any?(' ') }
  end

  def game_ended
    2.times do |index|
      piece = index.zero? ? 'X' : 'O'
      row_won = check_rows_for(piece)
      column_won = check_columns_for(piece)
      cross_won = check_cross_for(piece)
      draw = check_for_draw
      return true if row_won || column_won || cross_won || draw
    end

    false
  end

  def who_won?
    @turn.zero? ? @player_one.name : @player_two.name
  end

  def play_round
    switch_turn
    prompt_player_move
  end
end
