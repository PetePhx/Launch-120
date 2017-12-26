=begin

Method Lookup (Part 1)

Using the following code, determine the lookup path used when invoking
cat1.color. Only list the classes that were checked by Ruby when searching for
the #color method.

=end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
puts "=== Cat Method Lookup Path ==="
puts Cat.ancestors
#
# Since Cat is a subclass of Animal, and the method #color is not defined in Cat
# the interpreter looks up in Animal for #color definition, and executes it.
# Classes Cat and Animal are searched.
