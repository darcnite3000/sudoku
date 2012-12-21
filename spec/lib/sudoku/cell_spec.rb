require 'spec_helper'
require 'sudoku/puzzle'
require 'sudoku/cell'
describe Sudoku::Cell do
  let(:solved_array) do
     [1,2,3,4,5,6,7,8,9,
      4,5,6,7,8,9,1,2,3,
      7,8,9,1,2,3,4,5,6,
      6,3,5,2,1,8,9,4,7,
      2,7,8,6,9,4,5,3,1,
      9,4,1,5,3,7,8,6,2,
      8,9,7,3,6,5,2,1,4,
      5,6,2,9,4,1,3,7,8,
      3,1,4,8,7,2,6,9,5]
  end
  let(:solved_puzzle){ Sudoku::Puzzle.new(solved_array) }
  it 'represents a positional cell in a puzzle' do
    cell = Sudoku::Cell.new 0, 0, 1, solved_puzzle
    expect(cell).to eq(solved_puzzle[0,0])
  end
  it 'can get its available values' do
    cell = Sudoku::Cell.new 0, 0, 1, solved_puzzle
    expect(cell.available).to eq([1])
  end
end