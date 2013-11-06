class Army
  attr :side

  def unimplemented
    raise "not implemented!"
  end

  def initialize(side)
    @side = side
  end

  def king
    # should return class for King piece
    unimplemented
  end

  def queen
    unimplemented
  end

  def rook
    unimplemented
  end

  def bishop
    unimplemented
  end

  def pawn
    unimplemented
  end
end