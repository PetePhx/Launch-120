=begin

Given the following code...

bob = Person.new
bob.hi

And the corresponding error message...

NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

What is the problem and how would you go about fixing it?

=end

# the method hi is defined as a private method, hence can't be invoked directly
# from outside the class. Changing it from private to a public method would
# resolve the problem

class Person
  def hi
    puts "hi there!"
  end
  private
end

bob = Person.new
bob.hi
