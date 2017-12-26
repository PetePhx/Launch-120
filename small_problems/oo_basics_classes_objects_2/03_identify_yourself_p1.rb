=begin

Identify Yourself (Part 1)

Using the following code, add a method named #identify that returns its calling
object.

=end

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify
# #<Cat:0x0000559b00d01ee8 @name="Sophie">
