=begin
You want to create a nice interface that allows you to accurately describe the
action you want your program to perform. Create a method called spray_paint that
can be called on an object and will modify the color of the car.
=end

class MyCar
  attr_accessor :speed
  attr_reader :year, :color

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
p car.color
car.spray_paint("white")
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
