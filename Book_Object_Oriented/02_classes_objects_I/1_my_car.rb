class MyCar
  # attr_accessor :year, :color, :model, :speed

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed
    @speed
  end
  
  def speed_up(n)
    @speed += n
  end

  def break(n = 10)
    @speed -= n
  end

  def shut_off
    @speed = 0
  end
end

car = MyCar.new(2010, "Toyota", "black")
p car.speed
car.speed_up(30)
car.speed_up(40)
p car.speed
car.break
car.break(50)
p car.speed
car.shut_off
p car.speed
