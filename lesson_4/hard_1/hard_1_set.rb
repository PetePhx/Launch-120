puts
#==============================================================================#
puts "Question 1"

# Alyssa has been assigned a task of modifying a class that was initially
# created to keep track of secret information. The new requirement calls for
# adding logging, when clients of the class attempt to access the secret data.
# Here is the class in its current form.

# She needs to modify it so that any access to data must result in a log entry
# being generated. That is, any call to the class which will result in data
# being returned must first call a logging class. The logging class has been
# supplied to Alyssa and looks like the following:

# Hint: Assume that you can modify the initialize method in SecretFile to have
# an instance of SecurityLogger be passed in as an additional argument. It may
# be helpful to review the lecture on collaborator objects for this practice
# problem.

# A) we remove the attr_reader declaration for @data, create a logger object in
# the initia.ize method to serve as a collaborator object, and use it in our
# custom defined  getter method for data. Alternatively, we could also pass the
# SecurityLogger as an object to the initialization code.

class SecretFile
  # attr_reader :data
  def initialize(secret_data)
    @data = secret_data
    @logger = SecurityLogger.new
  end

  def data
    @logger.create_log_entry
    @data
  end
end

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end

sec_file = SecretFile.new("secret")
puts sec_file.data
# secret

puts
#==============================================================================#
puts "Question 2"

# Ben and Alyssa are working on a vehicle management system. So far, they have
# created classes called Auto and Motorcycle to represent automobiles and
# motorcycles. After having noticed common information and calculations they
# were performing for each type of vehicle, they decided to break out the
# commonality into a separate class called WheeledVehicle. This is what their
# code looks like so far.

# Now Alan has asked them to incorporate a new type of vehicle into their system
# - a Catamaran defined as follows.

# This new class does not fit well with the object hierarchy defined so far.
# Catamarans don't have tires. But we still want common code to track fuel
# efficiency and range. Modify the class definitions and move code into a
# Module, as necessary, to share code among the Catamaran and the wheeled
# vehicles.

# A) We rename the original WheeledVehicle class to a more generic Vehicle class
# name, then move all the functionality related to wheels to a module named
# Wheels. Now all three vehicle types are subclasses of Vehicle, with Auto and
# Motorcycle also including the Wheels module. The initialize methods for the
# latter are updated as well to reflect this rearrangmenet.

module Wheels
  def set_tire_pressures(tire_array)
    @tires = tire_array
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Vehicle
  attr_accessor :speed, :heading

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < Vehicle
  include Wheels
  def initialize
    # 4 tires are various tire pressures
    set_tire_pressures([30,30,32,32])
    super(50, 25.0)
  end
end

class Motorcycle < Vehicle
  include Wheels
  def initialize
    set_tire_pressures([20,20])
    # 2 tires are various tire pressures
    super(80, 8.0)
  end
end

class Catamaran < Vehicle
  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super(km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end

p Auto.new
p Motorcycle.new

#<Auto:0x0000560da8d32d20 @tires=[30, 30, 32, 32], @fuel_efficiency=50, @fuel_capacity=25.0>
#<Motorcycle:0x0000560da8d32a28 @tires=[20, 20], @fuel_efficiency=80, @fuel_capacity=8.0>

puts
#==============================================================================#
puts "Question 3"

# Building on the prior vehicles question, we now must also track a basic
# motorboat. A motorboat has a single propeller and hull, but otherwise behaves
# similar to a catamaran. Therefore, creators of Motorboat instances don't need
# to specify number of hulls or propellers. How would you modify the vehicles
# code to incorporate a new Motorboat class?

# We can define the Motorboat class as following to be in sync with the rest of
# the class definitions above:

class Motorboat < Vehicle
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @num_propellers = 1
    @num_hulls = 1
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end
end


puts
#==============================================================================#
puts "Question 4"

# The designers of the vehicle management system now want to make an adjustment
# for how the range of vehicles is calculated. For the seaborne vehicles, due to
# prevailing ocean currents, they want to add an additional 10km of range even
# if the vehicle is out of fuel.
#
# Alter the code related to vehicles so that the range for autos and motorcycles
# is still calculated as before, but for catamarans and motorboats, the range
# method will return an additional 10km.

# A) We can create a Seaborne module to encapsulate the range adjustment
# specific to the seaborne vehicles. By including the module in Motorboat and
# Cataraman, this will override the default behavior of #range from Vehicle
# superclass, since it is nearer in the method lookup path hierarchy.

module Seaborne
  attr_accessor :propeller_count, :hull_count
  RANGE_ADJUSTMENT = 10 # km
  def range
    @fuel_capacity * @fuel_efficiency + RANGE_ADJUSTMENT
  end
end

class Catamaran < Vehicle
  include Seaborne
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super(km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end

class Motorboat < Vehicle
  include Seaborne
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @num_propellers = 1
    @num_hulls = 1
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

mboat = Motorboat.new(100, 5)
puts mboat.range # 510
