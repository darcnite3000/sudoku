require 'sudoku/cell_group'

module Sudoku
  class Puzzle
    class Invalid < StandardError
    end
    Blocks = 
      [
        0,0,0,1,1,1,2,2,2,
        0,0,0,1,1,1,2,2,2,
        0,0,0,1,1,1,2,2,2,
        3,3,3,4,4,4,5,5,5,
        3,3,3,4,4,4,5,5,5,
        3,3,3,4,4,4,5,5,5,
        6,6,6,7,7,7,8,8,8,
        6,6,6,7,7,7,8,8,8,
        6,6,6,7,7,7,8,8,8
      ].freeze
    ValidValueRange = (0..9)
    
    def initialize puzzle=Array.new(81)
      @cells = Array.new(puzzle) if puzzle.length == 81
      @cells.map!{ |cell| ValidValueRange === cell ? cell : 0 }
    end
    def []= x,y,value
      @cells[coord_to_pos x, y] = value if ValidValueRange === value
    end
    def [] x,y
      @cells[coord_to_pos x, y] ||= 0
    end
    
    def valid?
      8.times do |i|
        return false unless column(i).valid? && row(i).valid? && block(i).valid?
      end
      true
    end
    
    def column x
      col = CellGroup.new
      x.step(80,9){|i| col << @cells[i] }
      col
    end
    
    def row y
      CellGroup.new(@cells[(y*9)..((y+1)*9)])
    end
    
    def block position
      block = CellGroup.new
      @cells.each_index do |index|
        block << @cells[index] if Blocks[index] == position
      end
      block
    end
    
    private
    def coord_to_pos x,y
      y*9 + x
    end
    def pos_to_coord cell
      cell.divmod 9
    end 
  end
  
end