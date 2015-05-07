require 'ship'

describe Ship do

  it 'to have a ship with a length of one' do
    expect(subject.length).to eq 1
  end

  it 'exist in selection of other ships with different lengths' do
    destroyer = Ship.new(6)
    aircraft_carrier = Ship.new(4)
    expect(destroyer.length != aircraft_carrier.length).to eq true
  end

  it 'loses health when hit' do
    destroyer = Ship.new(6)
    destroyer.hit
    expect(destroyer.health).to eq(5)
  end

  it 'can report if it is sunk' do
    subject.hit
    expect(subject).to be_sunk
  end

end