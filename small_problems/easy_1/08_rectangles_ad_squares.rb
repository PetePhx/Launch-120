=begin

Rectangles and Squares

Given the following class,

Write a class called Square that inherits from Rectangle, and is used like this:

=end

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(width)
    super(width, width)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"

# Note: While this implementation works, this is where inheritance is not really
# helpful, as we are carrying redundant identical ivars (width and height) in
# the Square class due to inheritance from Rectangle.
