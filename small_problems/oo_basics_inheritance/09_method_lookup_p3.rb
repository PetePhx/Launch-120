=begin

Method Lookup (Part 3)

Using the following code, determine the lookup path used when invoking
bird1.color. Only list the classes or modules that were checked by Ruby when
searching for the #color method.

=end

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color

puts "=== Bird Method Lookup Path ==="
puts Bird.ancestors

# since #color is defined in Animal class, ruby interpreter will look in the
# following classes in this order: Bird, Flyable, Animal
