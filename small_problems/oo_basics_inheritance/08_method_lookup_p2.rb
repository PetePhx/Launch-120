=begin

Method Lookup (Part 2)

Using the following code, determine the lookup path used when invoking
cat1.color. Only list the classes and modules that Ruby will check when
searching for the #color method.

=end

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
# cat1.color
puts "=== Cat Method Lookup Path ==="
puts Cat.ancestors

# Since color is not defined in any of Cat's superclasses, the ruby interpreter
# will go through all the superclasses in the following order, and then raise a
# NoMethodError exception: Cat, Animal, Object, Kernel, BasicObject
