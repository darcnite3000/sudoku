module Sudoku
  class CellGroup
    ValidValueRange = (0..9)
    ValidCount = (1..9).inject{|sum,x|sum+x}
    MaxLength = 9
    
    def initialize enumerable=nil
      @data = []
      if enumerable.respond_to? :each
        enumerable.each do |x|
          self << x
        end
      end
    end
    
    def << value
      @data << value if @data.length < MaxLength && ValidValueRange === value
    end
    alias_method :add, :<<
    
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
      @data.uniq.inject{|sum,x|sum+x} == ValidCount
    end
  end
end