# Override the to_s method to create a user friendly print out of your object.

class MyCar
  attr_accessor :speed, :model
  attr_reader :year, :color

  def self.gas_mileage(miles, gallons)
    if miles != 0 && !miles.nil? && !gallons.nil?
      miles.fdiv gallons
    else
      nil
    end
  end

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed_up(n)
    self.speed = speed + n
  end

  def break(n = 10)
    self.speed = speed - n
  end

  def shut_off
    self.speed = 0
  end

  def spray_paint(c)
    @color = c
  end

  def to_s
    "Model: #{model}, Year: #{year}, Color: #{color}"
  end
end

car = MyCar.new(2010, "black", "Camry")
puts car
# Model: Camry, Year: 2010, Color: black
