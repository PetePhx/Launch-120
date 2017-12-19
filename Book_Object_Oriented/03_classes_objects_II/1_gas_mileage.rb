# Add a class method to your MyCar class that calculates the gas mileage of any
# car.

class MyCar
  attr_accessor :speed
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
end

car = MyCar.new(2010, "black", "Camry")
p MyCar.gas_mileage(300, 13)
