require 'sudoku/cell_group'

module Sudoku
  class Puzzle
    class Invalid < StandardError
    end
    Blocks = 
     [0,0,0,1,1,1,2,2,2,
      0,0,0,1,1,1,2,2,2,
      0,0,0,1,1,1,2,2,2,
      3,3,3,4,4,4,5,5,5,
      3,3,3,4,4,4,5,5,5,
      3,3,3,4,4,4,5,5,5,
      6,6,6,7,7,7,8,8,8,
      6,6,6,7,7,7,8,8,8,
      6,6,6,7,7,7,8,8,8].freeze
    
    def initialize puzzle=Array.new(81)
      @cells = Array.new(puzzle) if puzzle.length == 81
      @cells.map! do |cell| 
        if (0..9) === cell
          cell
        else
          0
        end
      end
    end
    def []= x,y,value
      @cells[coord x, y] = value if (0..9) === value
    end
    def [] x,y
      @cells[coord x, y] ||= 0
    end
    
    def valid?
      (0..8).each do |i|
        return false unless column(i).valid? && row(i).valid? && block(i).valid?
      end
      true
    end
    
    def column x
      col = CellGroup.new
      (x..80).step(9){|i| col << @cells[i] }
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
    def coord x,y
      y*9 + x
    end
  end
  
end