require 'capybara/rspec'
require 'board'
require 'ship'

feature 'Set up a game of battleships' do

  let(:player) { Player.new }
  let(:board) { Board.new }
  let(:ship) { Ship.new }

  scenario 'player is allocated a fleet of ships' do
    expect(player.ships.count).to eq 8
  end

  scenario 'put a ship on the board with a given orientation' do
    board.place_ship ship, 'A1', 'v'
    expect(board.grid_read 'A1').to be ship
  end

  scenario 'ship cannot be placed on board more than once' do
    board.place_ship ship, 'A1', 'v'
    expect { board.place_ship ship, 'E5', 'h' }.to raise_error 'ship already on grid!'
  end

  scenario 'ensure ship does not go off edge of grid vertically' do
    destroyer = Ship.new 2
    expect { board.place_ship destroyer, 'J10', 'v'}.to raise_error 'boat is off the grid!'
  end

  scenario 'ensure ship does not go off grid horizontally' do
    destroyer = Ship.new 2
    expect { board.place_ship destroyer, 'J10', 'h'}.to raise_error 'boat is off the grid!'
  end

  scenario 'ensure ships do not overlap' do
    dinghy1 = Ship.new 3
    board.place_ship dinghy1, 'A2', 'h'
    dinghy2 = Ship.new 3
    expect { board.place_ship dinghy2, 'B1', 'v' }.to raise_error 'boats have overlapped!'
  end

  scenario 'ensure ship occupies all appropriate grid squares (vertically)' do
    dinghy = Ship.new 2
    board.place_ship dinghy, 'A1', 'v'
    expect(board.grid_read 'A2').to be dinghy
  end

  scenario 'ensure ship occupies all appropriate grid squares (horizontally)' do
    dinghy = Ship.new 2
    board.place_ship dinghy, 'A1', 'h'
    expect(board.grid_read 'B1').to be dinghy
  end
end

feature 'Playing a game of battleships' do

  let(:board) { Board.new }
  let(:ship) { Ship.new}

  scenario 'ships can be fired at' do
    board.place_ship ship, 'B7', 'h'
    board.fire 'B7'
    expect(board.grid_read 'B7').to eq '*'
  end

  scenario 'ship can register a hit' do
    aircraft_carrier = Ship.new 6
    board.place_ship aircraft_carrier, 'A1', 'h'
    board.fire 'A1'
    expect(aircraft_carrier.health).to eq 5
  end

  scenario 'ship can report if it is sunk' do
    board.place_ship ship, 'A1', 'h'
    board.fire 'A1'
    expect(ship).to be_sunk
  end

end