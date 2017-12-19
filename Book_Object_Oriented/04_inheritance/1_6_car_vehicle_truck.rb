class Vehicle
  attr_accessor :year, :model, :speed
  @@num_objects = 0

  def initialize(y, m)
    @year = y
    @model = m
    @speed = 0
    @@num_objects += 1
  end

  def self.num_vehicles
    @@num_objects
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

  def display_age
    puts "Vehicle Age: #{age}"
  end

  private

  def age
    Time.now.year - year
  end

end

class MyCar < Vehicle
  attr_accessor :name
  attr_reader :color
  MAX_SPEED = 150
  def initialize(y, c, m)
    super(y, m)
    @color = c
  end

  def spray_paint(c)
    @color = c
  end
end

module Transit
  def transit_doc_req?(weigth_max)
    weigth_max > 10000
  end
end

class Truck < Vehicle
  include Transit
  CARGO_MAX = 5000
  attr_accessor :current_cargo

  def initialize(y, m, cargo)
    super(y, m)
    @current_cargo = cargo
  end

  def transit_doc_req?
    super(CARGO_MAX)
  end
end

honda = MyCar.new(2012, "silver", "civic")
p honda #<MyCar:0x0000556f10bc91a0 @year=2012, @model="civic", @color="silver", @speed=0>
p honda.speed_up(50)
p honda.break(30)
p honda.shut_off

ford = Truck.new(2014, "F150", 1000)
p ford #<Truck:0x0000556f10bc8458 @year=2014, @model="F150",  @current_cargo=1000>
p ford.speed_up(20)
p ford.shut_off

p Vehicle.num_vehicles # 2

p ford.transit_doc_req? # false. 5000 less than the 10000 threshold

classes = [Vehicle, MyCar, Truck]
classes.each do |cls|
  puts "-"*10 + "#{cls}" + "-"*10
  puts cls.ancestors
end # output blow

puts
honda.display_age # 5
ford.display_age # 3

=begin
----------Vehicle----------
Vehicle
Object
Kernel
BasicObject
----------MyCar----------
MyCar
Vehicle
Object
Kernel
BasicObject
----------Truck----------
Truck
Transit
Vehicle
Object
Kernel
BasicObject
=end
