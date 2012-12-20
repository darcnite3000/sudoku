module Sudoku
  class CellGroup
    def initialize enumerable=nil
      @data = []
      if enumerable.respond_to? :each
        enumerable.each do |x|
          self << x
        end
      end
    end
    
    def << value
      @data << value if @data.length < 9 && (0..9) === value
    end
    
    def [] x
      @data[x]
    end
    
    def to_a
      Array.new @data
    end
    
    def to_s
      @data.to_s
    end
    
    def valid?
      @data.uniq.inject{|sum,x|sum+x} == 45
    end
  end
end