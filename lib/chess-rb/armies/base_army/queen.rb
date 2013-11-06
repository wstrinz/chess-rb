class Queen < Piece
  def valid_moves(cells=board.cells.values)
    # Ignores obstructions/pieces
    cells.select { |c|
      (c.x - x).abs == (c.y - y).abs ||
      (c.x == x or c.y == y)
    }.reject { |c| obstructed?(c) || contains_friendly?(c) }
  end
end