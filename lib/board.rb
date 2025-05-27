class Board
  attr_reader :grid

  def initialize
    @grid = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  def place(piece, row, column)
    return puts 'This is not a valid piece' unless %w[X O].include?(piece)
    return puts 'This column does not exist' unless row.between?(0, 2) && column.between?(0, 2)
    return puts 'There is already a piece in this column' unless @grid[row][column] == ' '

    @grid[row][column] = piece
  end

  def display
    @grid.each do |row|
      puts "|#{row[0]}| |#{row[1]}| |#{row[2]}|"
    end
  end
end
