class Board

  attr_reader :grid

  def initialize
    @grid = [{ 'A' => '0', 'B' => '0', 'C' => '0', 'D' => '0', 'E' => '0', 'F' => '0', 'G' => '0', 'H' => '0', 'I' => '0', 'J' => '0' },
             { 'A' => '0', 'B' => '0', 'C' => '0', 'D' => '0', 'E' => '0', 'F' => '0', 'G' => '0', 'H' => '0', 'I' => '0', 'J' => '0' },
             { 'A' => '0', 'B' => '0', 'C' => '0', 'D' => '0', 'E' => '0', 'F' => '0', 'G' => '0', 'H' => '0', 'I' => '0', 'J' => '0' },
             { 'A' => '0', 'B' => '0', 'C' => '0', 'D' => '0', 'E' => '0', 'F' => '0', 'G' => '0', 'H' => '0', 'I' => '0', 'J' => '0' },
             { 'A' => '0', 'B' => '0', 'C' => '0', 'D' => '0', 'E' => '0', 'F' => '0', 'G' => '0', 'H' => '0', 'I' => '0', 'J' => '0' },
             { 'A' => '0', 'B' => '0', 'C' => '0', 'D' => '0', 'E' => '0', 'F' => '0', 'G' => '0', 'H' => '0', 'I' => '0', 'J' => '0' },
             { 'A' => '0', 'B' => '0', 'C' => '0', 'D' => '0', 'E' => '0', 'F' => '0', 'G' => '0', 'H' => '0', 'I' => '0', 'J' => '0' },
             { 'A' => '0', 'B' => '0', 'C' => '0', 'D' => '0', 'E' => '0', 'F' => '0', 'G' => '0', 'H' => '0', 'I' => '0', 'J' => '0' },
             { 'A' => '0', 'B' => '0', 'C' => '0', 'D' => '0', 'E' => '0', 'F' => '0', 'G' => '0', 'H' => '0', 'I' => '0', 'J' => '0' },
             { 'A' => '0', 'B' => '0', 'C' => '0', 'D' => '0', 'E' => '0', 'F' => '0', 'G' => '0', 'H' => '0', 'I' => '0', 'J' => '0' }]
  end

  def place_ship ship, coords, orientation
    ship_fit ship, coords, orientation
    fail 'boats have overlapped!' unless space_clear? coords
    insert_ship(ship, coords, orientation)
  end

  def ship_fit ship, coords, orientation
    x_axis coords
    if orientation == 'v'
      fail 'boat is off the grid!' if (x_axis(coords)) + ship.length > grid.length
    elsif orientation == 'h'
      fail 'boat is off the grid!' if (y_axis_to_num(coords) - 1) + ship.length > grid.length
    end
  end

  def x_axis coords
    (coords.slice(1, 2).to_i) - 1
  end

  def y_axis_to_num coords
    alphabet = ('A'..'J').to_a
    val = coords.slice(0)
    (alphabet.index(val)) + 1
  end

  def y_axis coords
    coords.slice(0)
  end

  def space_clear? coords
    grid_read(coords) == '0'
  end

  def grid_read coords
    @grid[x_axis(coords)][y_axis(coords)]
  end

  def insert_ship ship, coords, orientation
    n = 0
    if orientation == 'v'
      ship.length.times do
        @grid[x_axis(coords)+n][y_axis(coords)] = ship
        n += 1
      end
    elsif orientation == 'h'
      y_val = y_axis(coords)
      ship.length.times do
        @grid[x_axis(coords)][y_val] = ship
        y_val = y_val.next
      end
    end
  end

  def fire coords
    @grid[x_axis(coords)][y_axis(coords)] = '*'
  end

end