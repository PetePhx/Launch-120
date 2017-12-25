=begin

Accessor

Using the code from the previous exercise, replace the getter and setter methods
using Ruby shorthand.

=end

class Cat
  attr_accessor :name

  def initialize(str)
    @name = str
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
# Hello! My name is Sophie!
kitty.name = 'Luna'
kitty.greet
# Hello! My name is Luna!
