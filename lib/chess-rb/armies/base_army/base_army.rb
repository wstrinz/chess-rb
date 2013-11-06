class BaseArmy < Army
  def pawn
    Pawn
  end

  def king
    # should return class for King piece
    King
  end

  def queen
    Queen
  end

  def bishop
    Bishop
  end

  def knight
    Knight
  end

  def rook
    Rook
  end
end