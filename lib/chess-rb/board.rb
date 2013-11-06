class Board
  attr :size

  def initialize(size=8)
    @size = size

    size.times do |y|
      size.times do |x|
        cells[[x,y]] = Cell.new(x,y)
      end
    end
  end

  def side_transform(side, coordinates)
    if side == 1
      [coordinates[0], size - coordinates[1] - 1]
    else
      coordinates
      # [coordinates[0], coordinates[1]]
    end
  end

  def setup_army(army, side)
    armies[side] = army

    # Add armies Pawns to board
    8.times do |x|
      c = cells[side_transform(side,[x,1])]
      c.piece = army.pawn.new(self, c, army)
    end

    [0,7].each do |x|
      c = cells[side_transform(side,[x,0])]
      c.piece = army.rook.new(self, c, army)
    end

    [1,6].each do |x|
      c = cells[side_transform(side,[x,0])]
      c.piece = army.knight.new(self, c, army)
    end

    [2,5].each do |x|
      c = cells[side_transform(side,[x,0])]
      c.piece = army.bishop.new(self, c, army)
    end

    add_piece(army.queen, army, [3,0])
    # c = cells[side_transform(side,[3,0])]
    # c.piece = army.queen.new(self, c, army)

    c = cells[side_transform(side,[4,0])]
    c.piece = army.king.new(self, c, army)

    army
  end

  def add_piece(klass,army,loc)
    c = cells[side_transform(army.side,loc)]
    p = klass.new(self, c, army)
    c.piece = p
  end

  def move_to(piece, cell)
    # raise "Can't move #{piece} to #{cell}!" unless piece.valid_moves.include? cell

    piece.cell.piece = nil
    piece.cell = cell
    cell.piece = piece
  end

  def armies
    @armies ||= [nil,nil]
  end

  def cells
    @cells ||= {}
  end

  def cells_between(a,b)
    raise "not implemented"
  end
end