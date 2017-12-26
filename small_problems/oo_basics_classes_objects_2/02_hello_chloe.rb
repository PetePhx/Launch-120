=begin

Hello, Chloe!

Using the following code, add an instance method named #rename that renames
kitty when invoked.

=end

class Cat
  attr_accessor :name

  def initialize(str)
    @name = str
  end

  def rename(str)
    self.name = str
  end
end

kitty = Cat.new('Sophie')
puts kitty.name
# Sophie
kitty.rename('Chloe')
puts kitty.name
# Chloe
