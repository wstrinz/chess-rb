class King < Piece
  def valid_moves(cells)
    # Ignores obstructions/pieces
    cells.select { |c|
      (c.x - x).abs == (c.y - y).abs ||
      (c.x == x or c.y == y)
    }
  end
end