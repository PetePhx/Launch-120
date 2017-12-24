puts
#==============================================================================#
puts "Question 1"

# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:

hello = Hello.new
hello.hi

# #bye invokes the inherited method greet with argument "hello", which outputs
# "Hello"

# case 2:

hello = Hello.new
# hello.bye

# The method #bye is not defined in class Hello or any of its superclasses,
# hence returning a NoMethodError.

# case 3:

hello = Hello.new
# hello.greet

# invoking the inherited #greet method expecting one argument with no arguments
# raises an ArgumentError.

# case 4:

hello = Hello.new
hello.greet("Goodbye")

# The inherited method #greet will output "Goodbye".

# case 5:

# Hello.hi

# #hi is an instance method, calling it on the Hello class will raise a
# NoMethodError.

puts
#==============================================================================#
puts "Question 2"

# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

# A) Since hi is an instance method, we can modify the method call to invoke it
# on an object:

Hello.new.hi
# Hello

puts
#==============================================================================#
puts "Question 3"

# When objects are created they are a separate realization of a particular
# class.

# Given the class below, how do we create two different instances of this class,
# both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# A) By invoking the #new mthod separately:

mittens = AngryCat.new(4, "mittens")
kittens = AngryCat.new(3, "kittens")

p mittens == kittens
# false

puts
#==============================================================================#
puts "Question 4"

# Given the class below, if we created a new instance of the class and then
# called to_s on that instance we would get something like
# "#<Cat:0x007ff39b356d30>"

# How could we go about changing the to_s output on this method to look like
# this: I am a tabby cat? (this is assuming that "tabby" is the type we passed
# in during initialization).

# A) By defining the to_s method to override its inherited default behavior:

class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{@type} cat."
  end
end

p Cat.new("tabby").to_s == "I am a tabby cat."
# true

puts
#==============================================================================#
puts "Question 5"

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
# tv.manufacturer
tv.model

Television.manufacturer
# Television.model

# A) #manufacturer is a class method and can not be called on an instance. Line
# 180 above would raise a NoMethodError. On the same token, calling the instance
# method #model on the class itself would result in a NoMothodError.

puts
#==============================================================================#
puts "Question 6"

# If we have a class such as the one below:

class CatOld
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# In the make_one_year_older method we have used self. What is another way we
# could write this method so we don't have to use the self prefix?

# A) we could either assign directly to the ivar @age in the method body,

# @age += 1


class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

sphinx = Cat.new("sphinx")
3.times { sphinx.make_one_year_older }
puts sphinx.age
# 3

puts
#==============================================================================#
puts "Question 7"

# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end

# A) the instance variables @brightness and @color are initialized in the
# initialize method, but are not used anywhere else, as the class method
# #information always returns the same string. There is also unneeded return
# keyword in the #information body.
