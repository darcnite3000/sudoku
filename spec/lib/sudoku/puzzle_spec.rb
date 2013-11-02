require 'spec_helper'

describe Sudoku::Puzzle do
  let(:blank_puzzle) { Sudoku::Puzzle.new }
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
  
  it 'can build a puzzle given a array' do
    puzzle = Sudoku::Puzzle.new(solved_array)
    expect(puzzle[0,0]).to eq(1)
    expect(puzzle[8,8]).to eq(5)
  end
  it 'will 0 any invalid values from a staring array' do
    puzzle = Sudoku::Puzzle.new(Array.new(81))
    expect(puzzle[0,0]).to eq(0)
  end
  it 'can set the value of a cell to be 0..9' do
    blank_puzzle[0,0] = 1
    expect(blank_puzzle[0,0]).to eq(1)
    blank_puzzle[0,1] = 2
    expect(blank_puzzle[0,1]).to eq(2)
    blank_puzzle[1,1] = 10
    expect(blank_puzzle[1,1]).to eq(0)
  end
  it 'can return a row set' do
    expect(solved_puzzle.row 0 ).to eq([1,2,3,4,5,6,7,8,9])
  end
  it 'can return a column set' do
    expect(solved_puzzle.column 0).to eq([1,4,7,6,2,9,8,5,3])
  end
  it 'can return a block set' do
    expect(solved_puzzle.block 0).to eq([1,2,3,4,5,6,7,8,9])
  end
  it 'can return the related cell groups' do
    row, col, block = solved_puzzle.cell_groups 0, 0
    expect(row).to eq(solved_puzzle.row 0)
    expect(col).to eq(solved_puzzle.column 0)
    expect(block).to eq(solved_puzzle.block 0)
  end
  it 'can tell what values are available for a certain cell' do
    solved_puzzle[0,0] = 0
    expect(solved_puzzle.available_values 0, 0).to eq([1])
    expect(blank_puzzle.available_values 0, 0).to eq((1..9).to_a)
  end
  it 'is solved if all rows columns and blocks are solved' do
    expect(solved_puzzle.solved?).to eq(true)
    solved_puzzle[0,0] = 0
    expect(solved_puzzle.solved?).to eq(false)
  end
  it 'is valid if all rows columns and blocks are valid' do
    expect(solved_puzzle.valid?).to eq(true)
    solved_puzzle[0,0] = 9
    expect(solved_puzzle.valid?).to eq(false)
  end
  
end