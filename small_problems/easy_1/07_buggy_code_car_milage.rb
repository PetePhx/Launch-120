=begin

Buggy Code - Car Mileage

Fix the following code so it works properly:

=end

# A) within the increment_mileage method, the local variable mileage should be
# changed to ivar @mileage. The change in line 21 is not necessary, as the
# appreace on the RHS results in invoking the getter method for @mileage.

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    @mileage = total
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678
