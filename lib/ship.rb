class Ship

  attr_reader :length
  attr_reader :health
  attr_reader :name

  DEFAULT_LENGTH = 1
  DEFAULT_NAME = 'Bob'

  def initialize length = DEFAULT_LENGTH, name = DEFAULT_NAME
    @length = length
    @health = length

  end

  def hit
    @health -= 1
  end

  def sunk?
    health == 0
  end

# def game_won?c

#   # game = Game.new(some horrible arguments here?)
#   # #Kill all the ships on one board
#   # ships = []
#   # (1..5).each do |index|
#   #   ships[index] =
#   #  Ship.new(index)
#   # #   index.times {ships[index].hit}
#   # end
#   # expect(game.gameover).to be_true

#   # ships.all? { |ship| ship.sunk?}

end