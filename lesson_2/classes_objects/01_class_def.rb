# 1. Given the below usage of the Person class, code the class definition.

# bob = Person.new('bob')
# bob.name                  # => 'bob'
# bob.name = 'Robert'
# bob.name                  # => 'Robert'

class Person
  attr_accessor :name

  def initialize(n)
    @name = n
  end
end

bob = Person.new('bob')
puts bob.name                  # => 'bob'
bob.name = 'Robert'
puts bob.name
