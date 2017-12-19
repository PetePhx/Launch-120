module Swimmable
  def swim
    "I'm swimming..."
  end
end

class Animal
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  include Swimmable
  DOG_YEARS = 7
  attr_accessor :age

  def initialize(n, c, a)
    super(n)
    @color = c
    @age = a
  end

  def speak
    super + " There!"
  end

  def public_disclusure
    "#{name} in human years is #{human_years}. :)"
  end

  def public_method
    "tryin to call a protected method:... #{self.protected_method}... it worked!"
  end

  protected

  def protected_method
    "from protected method."
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparks", "brown", 5)
# paws = Cat.new

# puts sparky.speak           # => Sparky says arf!
# puts paws.speak             # => Hello!

p sparky
puts sparky.swim
puts sparky.age
# puts sparky.human_years : can't call private method
puts sparky.public_disclusure
puts sparky.public_method
