# Modify the class definition from above to facilitate the following methods.
# Note that there is no name= setter method now.
#
# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'
#
# Hint: let first_name and last_name be "states" and create an instance method
# called name that uses those states.

class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
    @first_name = n.split(' ')[0]
    @last_name = n.split(' ')[1].nil? ? '' : n.split(' ')[1]
  end

  def name
    first_name + ' ' + last_name
  end
end

bob = Person.new('Robert Smith')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => 'Smith'
bob.last_name = 'Schmith'
puts bob.name                  # => 'Robert Smith'
