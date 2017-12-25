=begin

Writer

Using the code from the previous exercise, add a setter method named #name.
Then, rename kitty to 'Luna' and invoke #greet again.

=end

class Cat
  def initialize(str)
    @name = str
  end

  def name
    @name
  end

  def name=(str)
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
