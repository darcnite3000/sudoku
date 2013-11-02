require 'spec_helper'

describe Sudoku::CellGroup do
  let(:blank_cellgroup){ Sudoku::CellGroup.new }
  it 'can tell if another cellgroup is equivelant' do
    expect(Sudoku::CellGroup.new(1..3)).to eq(Sudoku::CellGroup.new(1..3))
  end
  it 'can append values' do
    blank_cellgroup << 1
    expect(blank_cellgroup[0]).to eq(1)
    blank_cellgroup.add(2)
    expect(blank_cellgroup[1]).to eq(2)
  end
  it 'is rejects non 0..9 values' do
    blank_cellgroup << 10
    expect(blank_cellgroup[0]).to eq(nil)
  end
  it 'is limited to 9 values' do
    expect(Sudoku::CellGroup.new(0..9)).to eq([0,1,2,3,4,5,6,7,8])
  end
  it 'is solved if the unique values add up to 45' do
    (1..9).each {|x| blank_cellgroup << x}
    expect(blank_cellgroup.solved?).to eq(true)
  end

  it 'is solved if the unique values without 0 is the same as the values without 0' do
    (0..8).each {|x| blank_cellgroup << x}
    expect(blank_cellgroup.valid?).to eq(true)
  end
  
  it 'can return convert to an array' do
    expect(blank_cellgroup.to_a).to eq([])
  end
  it 'can initialize given an enumerable(anything that responds to each)' do
    expect(Sudoku::CellGroup.new(1..3)).to eq([1,2,3])
  end
end