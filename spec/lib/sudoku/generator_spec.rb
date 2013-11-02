require 'spec_helper'

describe Sudoku::Generator do
  it "can generate a puzzle with the given amount of hints" do
    puzzle = Sudoku::Generator.generate 5
    expect(puzzle.to_a.select{|value| value!=0}.length).to eq 5
  end
end