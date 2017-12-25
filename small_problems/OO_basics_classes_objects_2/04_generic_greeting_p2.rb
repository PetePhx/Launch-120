=begin

Generic Greeting (Part 2)

Using the following code, add two methods: ::generic_greeting and
#personal_greeting. The first method should be a class method and print a
greeting that's generic to the class. The second method should be an instance
method and print a greeting that's custom to the object.

=end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! This is the Cat class speaking!"
  end

  def personal_greeting
    puts "Hello! This is #{name} speaking!"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
# Hello! This is the Cat class speaking!
kitty.personal_greeting
# Hello! This is Sophie speaking!
