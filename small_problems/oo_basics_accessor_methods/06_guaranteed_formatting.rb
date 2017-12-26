=begin

Guaranteed Formatting

Using the following code, add the appropriate accessor methods so that @name is
capitalized upon assignment.

=end

class Person
  attr_reader :name

  def name=(str)
    @name = str.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name
# Elizabeth
