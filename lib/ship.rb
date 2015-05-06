class Ship

  attr_reader :length

  DEFAULT_LENGTH = 1

  def initialize length = DEFAULT_LENGTH
    @length = length
  end

end