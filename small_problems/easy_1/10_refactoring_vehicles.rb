=begin

Refactoring Vehicles

Consider the following classes:

Refactor these classes so they all use a common superclass, and inherit behavior
as needed.

=end

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

car = Car.new("Honda", "Accord")
bike = Motorcycle.new("Yamaha", "FZ-10")
truck = Truck.new("Truck-Name", "Truck-Model", 50_000)

puts [car, bike, truck]

# Further Exploration

# Would it make sense to define a wheels method in Vehicle even though all of
# the remaining classes would be overriding it? Why or why not? If you think it
# does make sense, what method body would you write?

# A) It wouldn't make much sense, unless we want to reserve a default behavior
# for all future subclasses. The code would look the same in the presence of the
# wheels method in the Vehicle class, as the individual wheels mthods in all
# subclasses would automatically override the default behavior.
