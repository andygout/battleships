require 'board'
describe Board do
  it {is_expected.to respond_to :place_ship}

  it 'can retrieve number from coordinates' do
    expect(subject.x_axis('A1')).to eq 0
  end

  it 'can retrieve letter from coordinates (return as number equivalent)' do
    expect(subject.y_axis_to_num('A1')).to eq 1
  end

  it 'remembers where ships are' do
    ship = double :ship, length: 1
    subject.place_ship(ship, 'A1', 'v')
    expect(subject.grid_read('A1')).to eq ship
  end


end