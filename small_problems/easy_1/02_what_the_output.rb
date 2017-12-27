=begin

What's the Output?

Take a look at the following code.

What output does this code print? Fix this class so that there are no surprises
waiting in store for the unsuspecting developer.

=end

# A) after first round of printing the object, the ivar @name is changed to the
# uppercase version. To avoid this behavior, we can use nondestructive methods.

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# Further Exploration:

# What would happen in this case?

# This code "works" because of that mysterious to_s call in Pet#initialize.
# However, that doesn't explain why this code produces the result it does. Can
# you?

# A) In the initialize method we use #to_s, that converts the integer passed in
# as name to string and assigns it to @name. #upcase method has no effect on the
# integer string, hence normal functioning of the code.

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
