class Piece
  attr :army
  attr :board

  def initialize(board, loc_cell, army)
    @board = board
    @cell = loc_cell
    @army = army
  end

  def cell
    @cell
  end
  alias_method :loc, :cell
  alias_method :my_cell, :cell

  def cell=(cell)
    @cell = cell
  end
  alias_method :loc=, :cell=
  alias_method :my_cell=, :cell=

  def valid_moves(cells)
    raise "should override!"
  end

  # Behavior customization

  def on_occupy
    #what to do when occupying a square; defaults to :capture
    :capture
  end

  def after_move
    nil
  end

  def capturable?
    true
  end

  def capture_friendly?
    false
  end


  # Helper methods

  def can_move_into?(cell)
    !cell.piece or (capture_friendly? or enemy?(piece))
  end

  def enemy?(piece)
    piece.army != army
  end

  def contains_enemy?(cell)
    cell.piece && enemy?(cell.piece)
  end

  def contains_friendly?(cell)
    cell.piece && !enemy?(cell.piece)
  end

  def obstructed?(cell)
    # board.cells_between(my_cell, cell).any? { |c| c.piece }
    false
  end

  def x
    cell.x
  end

  def y
    cell.y
  end
end