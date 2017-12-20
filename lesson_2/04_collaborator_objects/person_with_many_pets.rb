class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Animal
  def speak
    ''
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class BullDog < Animal
  def swim
    'Can\'t swim. No! Arf!'
  end
end

class Cat < Animal
  def speak
    'meow'
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = BullDog.new

bob.pets << kitty
bob.pets << bud

puts bob.pets

#<Cat:0x000055afa9146398>
#<BullDog:0x000055afa9143d28>

bob.pets.each do |pet|
  puts pet.jump
end

# jumping!
# jumping!
