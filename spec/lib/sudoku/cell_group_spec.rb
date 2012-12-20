require 'spec_helper'
require 'sudoku/cell_group'

describe Sudoku::CellGroup do
  let(:blank_cellgroup){ Sudoku::CellGroup.new }
  it 'can add values' do
    blank_cellgroup << 1
    expect(blank_cellgroup[0]).to eq(1)
  end
  it 'is rejects non 0..9 values' do
    blank_cellgroup << 10
    expect(blank_cellgroup[0]).to eq(nil)
    blank_cellgroup[0] = 10
    expect(blank_cellgroup[0]).to eq(nil)
  end
  it 'is valid if the unique values add up to 45' do
    (1..9).each {|x| blank_cellgroup << x}
    expect(blank_cellgroup.valid?).to eq(true)
  end
end