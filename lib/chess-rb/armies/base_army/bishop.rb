class Bishop < Piece
  def valid_moves(cells)
    # Ignores obstructions/pieces
    cells.select { |c|
      (c.x - x).abs == (c.y - y).abs
    }
  end
end