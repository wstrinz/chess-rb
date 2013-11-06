require_relative "../lib/chess-rb.rb"

describe Board do
  it "Creates a board" do
    b = Board.new
    b.should_not be nil
  end

  describe "armies" do
    before do
      @b = Board.new
    end

    it "Setup army" do
      a = BaseArmy.new(0)
      @b.setup_army(a, 0).should_not be nil
    end

    it "setup both armies" do
      a0 = BaseArmy.new(0)
      a1 = BaseArmy.new(1)
      @b.setup_army(a0, 0).should_not be nil
      @b.setup_army(a1, 1).should_not be nil
    end
  end

  describe "pieces" do
    before do
      @b = Board.new
      @a = BaseArmy.new(0)
      @b.setup_army(@a, 0)
    end

    describe Knight do
      it "correct starting moves" do
        k = @b.cells[[1,0]].piece
        k.should_not be nil
        valid = k.valid_moves

        valid.size.should == 2
        valid.include?(@b.cells[[0,2]]).should be true
        valid.include?(@b.cells[[2,2]]).should be true
      end
    end

    describe Queen do
      it "can move as Bishop or Rook" do
        @b = Board.new
        @a = BaseArmy.new(0)
        queen = @b.add_piece(Queen,@a,[4,4])

        locs = [[5,5],[6,6],[3,3],[4,5],[5,4]].map{|l| @b.cells[l]}
        (queen.valid_moves & locs).sort.should == locs.sort
      end
    end
  end

end