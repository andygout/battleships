require 'capybara/rspec'
require 'board'
require 'ship'

feature 'Set up a game of battleships' do

  let(:board) { Board.new }
  let(:ship) { Ship.new }

  scenario 'put a ship on the board with a given orientation' do
    board.place_ship ship, 'A1', 'v'
    expect(board.grid_read 'A1').to be ship
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
    dinghy1 = Ship.new 1
    board.place_ship dinghy1, 'A1', 'v'
    dinghy2 = Ship.new 1
    expect { board.place_ship dinghy2, 'A1', 'h' }.to raise_error 'boats have overlapped!'
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
  let(:ship) { Ship.new }

  scenario 'ships can be fired at' do
    board.place_ship ship, 'B7', 'h'
    board.fire 'B7'
    expect(board.grid_read 'B7').to eq '*'
  end

end