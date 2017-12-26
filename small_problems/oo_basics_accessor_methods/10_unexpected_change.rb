=begin

Unexpected Change

Modify the following code to accept a string containing a first and last name.
The name should be split into two instance variables in the setter method, then
joined in the getter method to form a full name.

=end

# Assuming the last name can have more than one component:

class Person
  def name=(str)
    arr = str.split(' ')
    @first_name = arr.first
    @last_name = arr.drop(1).join(' ')
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'Vincent Van Gogh'
puts person1.name
# Vincent van Gogh
