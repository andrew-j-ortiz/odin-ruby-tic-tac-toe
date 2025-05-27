# frozen_string_literal: false

# Player class
class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name.empty? ? %w[Bob Patrick Sandy Peter Chris Lois Brian Homer Lisa Bart].sample : name
    @piece = piece
  end
end
