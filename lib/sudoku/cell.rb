module Sudoku
  class Cell
    def initialize x, y, val, puzzle
      @x = x
      @y = y
      @value = val
      @puzzle = puzzle
    end
    def available
      r,c,b = @puzzle.cell_groups @x, @y
      values = (1..9).to_a - r.to_a - c.to_a - b.to_a
      values.length == 0 ? [@value] : values
    end
    def to_s
      @value
    end
    def == other
      other == @value
    end
  end
end
