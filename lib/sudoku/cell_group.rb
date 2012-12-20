module Sudoku
  class CellGroup
    def initialize
      @data = []
    end
    
    def << value
      @data << value if (0..9) === value
    end
    
    def []= x, value
      @data[x] = value if (0..9) === value
    end
    
    def [] x
      @data[x]
    end
    
    def valid?
      @data.uniq.inject{|sum,x|sum+x} == 45
    end
  end
end