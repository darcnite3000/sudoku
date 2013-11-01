require 'spec_helper'
require 'sudoku/puzzle'

module Sudoku
  class Generator
    def self.generate hints
      hint_count = hints
      r = Random.new
      p = Puzzle.new
      while hint_count > 0
        x = r.rand(9)
        y = r.rand(9)
        if p[x,y] == 0
          p[x,y] = r.rand(8)+1
          if !p.valid?
          else
            hint_count -= 1
          end
        end
      end
      p
    end
  end
end

describe Sudoku::Generator do
  it "can generate a puzzle with the given amount of hints" do
    puzzle = Sudoku::Generator.generate 5
    expect(puzzle.select{|value| value!=0}.length).to eq 5
  end
end