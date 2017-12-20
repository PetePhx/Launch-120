class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetch!'
  end
end

class BullDog < Dog
  def swim
    'can\'t swim! help!'
  end
end

bob = Person.new("Robert")
bud = BullDog.new

bob.pet = bud  # <== assigning one object to another's instance variable
               # i.e. collaborator object

puts bob.class
puts bob.pet.class
puts bob.pet.fetch
