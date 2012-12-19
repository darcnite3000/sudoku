module Sudoku
  class Puzzle
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
    
    def initialize puzzle=Array.new(81,0)
      @cells = Array.new(puzzle) if puzzle.length == 81
    end
    def []= x,y,value
      @cells[coord x, y] = value if (0..9) === value
    end
    def [] x,y
      @cells[coord x, y] ||= 0
    end
    
    def valid?
      (0..8).each do |i|
        return false unless column_valid?(i) && row_valid?(i) && block_valid?(i)
      end
      true
    end
    
    def column x
      col = []
      (x..80).step(9){|i| col << @cells[i] }
      col
    end
    
    def column_valid? y
      count = 0
      column(y).uniq.each {|cell| count+=cell }
      count == 45
    end
    
    def row y
      @cells[y...((y+1)*9)]
    end
    
    def row_valid? y
      count = 0
      row(y).uniq.each {|cell| count+=cell }
      count == 45
    end
    
    def block position
      block = []
      @cells.each_index do |index|
        block << @cells[index] if Blocks[index] == position
      end
      block
    end
    
    def block_valid? position
      count = 0
      block(position).uniq.each {|cell| count+=cell }
      count == 45
    end
    
    private
    def coord x,y
      y*9 + x
    end
  end
  
end