# Using the class definition from step #3, let's create a few more people --
# that is, Person objects.

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

# If we're trying to determine whether the two objects contain the same name,
# how can we compare the two objects?

# we can define a boolean method for name comparison:

class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
    @first_name = n.split(' ')[0]
    @last_name = n.split(' ')[1].nil? ? '' : n.split(' ')[1]
  end

  def name
    first_name + ' ' + last_name
  end

  def name=(n)
    if n.split(' ').size == 1
      @first_name = n
      @last_name = ''
    else
      @first_name = n.split(' ')[0]
      @last_name = n.split(' ')[1..-1].join(' ') #in case the last name has spaces
    end
  end

  def same_name?(other)
    self.name == other.name
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.same_name?(rob)
