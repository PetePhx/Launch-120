=begin

Generic Greeting (Part 1)

Modify the following code so that Hello! I'm a cat! is printed when
Cat.generic_greeting is invoked.

=end

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
# Hello! I'm a cat!
