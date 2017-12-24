puts
#==============================================================================#
puts "Question 1"

# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of calling

oracle = Oracle.new
oracle.predict_the_future

# A) Calling of the class method #new instantiates a new object, oracle.
# Invoking the instance method #predict_the_future returns the string resulting
# from concatanation with the random sampling from return of the instance method
# #choices, which return returns an array of strings.

puts oracle.predict_the_future
#  outputs one of:
#
# You will eat a nice lunch
# You will stay at work late
# You will take a nap soon

puts
#==============================================================================#
puts "Question 2"

# We have an Oracle class and a RoadTrip class that inherits from the Oracle
# class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

# A) The RoadTrip class inherits the #predict_the_future instance method from
# the superclass Oracle. It also overrides the #choices method by returning a
# different array of strings.

# Similar to the previous questions, we expect the srting return of "You will "
# concatanated with a random element of the new array:

puts trip.predict_the_future
# You will visit Vegas
# etc.

puts
#==============================================================================#
puts "Question 3"

# How do you find where Ruby will look for a method when that method is called?
# How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?

# A) Invoking the #ancestors method provides us with the method lookup chain:

puts Orange.ancestors
# Orange
# Taste
# Object
# Kernel
# BasicObject

puts HotSauce.ancestors
# HotSauce
# Taste
# Object
# Kernel
# BasicObject

puts
#==============================================================================#
puts "Question 4"

# What could you add to this class to simplify it and remove two methods from
# the class definition while still maintaining the same functionality?

# Instead of setter and getter methods for @type, we could use an attribute
# accessor to access the @type ivar. If @type isn't used, we don't need neither
# the attr_accessor nor the setter/getter methods.

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end
  #
  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

BeesWax.new("different type").describe_type
# I am a different type of Bees Wax

puts
#==============================================================================#
puts "Question 5"

# There are a number of variables listed below. What are the different types and
# how do you know which is which?

# A) instance and class variable names start with a single and doube @ character,
# respectively. local variable start with lower case letters as opposed to @ or
# @@.

excited_dog = "excited dog" # local var
@excited_dog = "excited dog" # instance variable
@@excited_dog = "excited dog" # class variable


puts
#==============================================================================#
puts "Question 6"

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would
# you call a class method?

# A) The #manufacturer is a class method, indicated by the self keyword prefix
# in the method declaration.

# Class methods are called directly on the class:

p Television.manufacturer # nil

puts
#==============================================================================#
puts "Question 7"

# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would
# you need to write to test your theory?

# A) @@cats_count is a class variable and it tracks the number of objects by
# being initialized to 0 in class definition and then incrementing by 1 every
# time a new object is instantiated.

# The method can be tested by examining the @@cats_count value before and after
# instantiating some objects of the Cat class:

p Cat.cats_count == 0 # true
mr_claws = Cat.new("sphinx")
ms_meow = Cat.new("persian")
mr_mittens = Cat.new("siamese")
p Cat.cats_count == 3 # true

puts
#==============================================================================#
puts "Question 8"

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And another class:

class Bingo_Old
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play method from
# the Game class?

# by declaring inheritance from the Game class in the Bingo class definition:

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

puts Bingo.new.play # Start the game

puts
#==============================================================================#
puts "Question 9"

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in
# mind that there is already a method of this name in the Game class that the
# Bingo class inherits from?

# A) The added method in the Bingo class would override the inherited method
# from the Game class. The method lookup starts looking for the method
# definition first from the class itself and then up th eancestors chain, based
# on the method lookup rules

puts
#==============================================================================#
puts "Question 10"

# What are the benefits of using Object Oriented Programming in Ruby? Think of
# as many as you can.

# A)
    # cleaner code, easier to communicate concepts
    # easier to understand the logic in code
    # easier to understand dependencies in code
    # easier to maintain code
    # easier to add or modify functionality
    # easier to modify and update the logic
    # resusable code
