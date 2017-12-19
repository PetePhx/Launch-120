=begin
Add an accessor method to your MyCar class to change and view the color of your
car. Then add an accessor method that allows you to view, but not modify, the
year of your car.
=end

class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year

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
end

car = MyCar.new(2010, "black", "Camry")
p car.color
car.color = "White"
p car.color
p car.year
p car.speed
car.speed_up(30)
car.speed_up(40)
p car.speed
car.break
car.break(50)
p car.speed
car.shut_off
p car.speed
