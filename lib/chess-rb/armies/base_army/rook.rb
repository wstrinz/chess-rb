class Rook < Piece
  def valid_moves(cells)
    # Ignores obstructions/pieces
    cells.select { |c|
      c.x == x or c.y == y
    }
  end
end