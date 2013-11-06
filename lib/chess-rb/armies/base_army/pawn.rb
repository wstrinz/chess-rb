class Pawn < Piece
  def valid_moves(cells)
    x = cell.x
    y = cell.y
    if y == 2
      #en passant not properly implemented
      cells.select { |c|
        c.y > y && c.y < y + 3 && (c.x - x).abs < 2
      }.select { |c|
        if c.x == x
          c.empty?
        else
          contains_enemy?(c)
        end
      }
    else
      cells.select{|c|
        (cell.distance(c) == 1) && (c.y > y)
      }.select { |c|
        if c.x == x
          c.empty?
        else
          contains_enemy?(c)
        end
      }
    end
  end
end