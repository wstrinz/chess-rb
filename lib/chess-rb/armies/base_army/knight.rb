class Knight < Piece
  def valid_moves(cells=board.cells.values)
    cells.select { |c|
      xd = (c.x - cell.x).abs
      yd = (c.y - cell.y).abs
      (xd == 1 and yd == 2) or (xd == 2 and yd == 1)
    }.select { |c|
      !contains_friendly?(c)
    }
  end
end