=begin

Fix the Program - Drivable

Correct the following program so it will work properly. Assume that the Car
class has a complete implementation; just make the smallest possible change to
ensure that cars have access to the drive method.

=end

# We change the drive method from class method to instancfe method by removing
# the keyword self in the class definition.

module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
