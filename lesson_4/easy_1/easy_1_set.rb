puts
#==============================================================================#
puts "Question 1"
#
# Which of the following are objects in Ruby? If they are objects, how can you
# find out what class they belong to?

    # true
    # "hello"
    # [1, 2, 3, "happy days"]
    # 142

# A) The four of them are objects of TrueClass, String, Array and Integer
# classes respectively. (using #class method)

puts true.class
puts "hello".class
puts [1, 2, 3, "happy days"].class
puts 142.class

# Question 1
# TrueClass
# String
# Array
# Integer

puts
#==============================================================================#
puts "Question 2"
#
# If we have a Car class and a Truck class and we want to be able to go_fast,
# how can we add the ability for them to go_fast using the module Speed? How can
# you check if your Car or Truck can now go fast?

# A) by including the Speed module in Car and Truck classes. We can check by
# invoking the #go_fast method

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed # here
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed # here
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_fast
Truck.new.go_fast

# I am a Car and going super fast!
# I am a Truck and going super fast!

puts
#==============================================================================#
puts "Question 3"

# In the last question we had a module called Speed which contained a go_fast
# method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# When we called the go_fast method from an instance of the Car class (as shown
# below) you might have noticed that the string printed when we go fast includes
# the name of the type of vehicle we are using. How is this done?
#
# >> small_car = Car.new
# >> small_car.go_fast
# I am a Car and going super fast!

# A) The string interpolation invokes the chained methods self.class. Whithin
# the context of an instance method, self refers to the object, and the class
# method returns the class the object belongs too, in this case being Car.

puts
#==============================================================================#
puts "Question 4"

# If we have a class AngryCat how do we create a new instance of this class?
#
# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# A) by invoking the class method new:

lilcat = AngryCat.new
lilcat.hiss           # Hisssss!!!

puts
#==============================================================================#
puts "Question 5"

# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The Pizza class has the intance variable @name, distinguished by the @ prefix.

# This can be verified using the #instance_variables method call:

p Fruit.new("pear").instance_variables # []
p Pizza.new("Hawaiian").instance_variables # [:@name]

# or inspecting the objects themselves:

p Fruit.new("pear") # #<Fruit:0x000055ae9cf455b0>
p Pizza.new("Hawaiian") # #<Pizza:0x000055ae9cf453f8 @name="Hawaiian">

puts
#==============================================================================#
puts "Question 6"

# What could we add to the class below to access the instance variable @volume?

# A) attribue accessor for the intance variable @volume. If we only want to read
# or write to the variable, attr_reader and attr_writer would be sufficient.
# Alternatively we could define getter and setter methods for the ivar.

class Cube
  attr_accessor :volume   # here
  def initialize(volume)
    @volume = volume
  end
end

qube = Cube.new(27)
puts qube.volume # 27

# In the absence of attr_* declarations and setter/getter methods, we can also
#  access the variable using the #instance_variable_get method:

puts qube.instance_variable_get("@volume") # 27

puts
#==============================================================================#
puts "Question 7"

# What is the default return value of to_s when invoked on an object? Where
# could you go to find out if you want to be sure?

# A) The #to_s method is implemented in the Object class and all other objects
# in subclasses inherit the method. According to ruby docs:
# The default to_s prints the object's class and an encoding of the object id.
# As a special case, the top-level object that is the initial execution context
# of Ruby programs returns “main''.

puts
#==============================================================================#
puts "Question 8"

# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. What does
# self refer to here?

# A) since defined within an instance method, self here references the calling
# object

mister_claws = Cat.new("sphinx")
4.times {mister_claws.make_one_year_older}
p mister_claws

# #<Cat:0x00005630c991f050 @type="sphinx", @age=4>

puts
#==============================================================================#
puts "Question 9"

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

# In the name of the cats_count method we have used self. What does self refer
# to in this context?

# A) The self keyword in the class scope refers to the class itself. Here self
# signifies the fact that the method to be defined is a class method.

puts Cat.cats_count # 0
mister_claws = Cat.new("sphinx")
puts Cat.cats_count # 1

puts
#==============================================================================#
puts "Question 10"

# If we have the class below, what would you need to call to create a new
# instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# A) the class method new with initialization parameters passed in as arguments:

wallet = Bag.new("brown", "leather")
p wallet
# #<Bag:0x00005634d6b37930 @color="brown", @material="leather">
