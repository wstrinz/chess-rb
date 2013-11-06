class Cell
  include Comparable

  attr_accessor :x, :y
  def initialize(x,y)
    @x = x
    @y = y
  end

  def <=>(other_cell)
    [@x, @y] <=> [other_cell.x, other_cell.y]
  end

  def distance(other_cell)
    raise "not implemented"
  end

  def piece
    @piece
  end

  def piece=(piece)
    @piece = piece
  end

  def empty?
    if @piece
      false
    else
      true
    end
  end
end