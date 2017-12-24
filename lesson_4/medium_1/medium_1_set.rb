puts
#==============================================================================#
puts "Question 1"

# Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Alyssa glanced over the code quickly and said - "It looks fine, except that
# you forgot to put the @ before balance when you refer to the balance instance
# variable in the body of the positive_balance? method."
#
# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an
# @!"
#
# Who is right, Ben or Alyssa, and why?

# A) balance in line 15 invokes the getter method for the instance variable
# @balance. The @ prefic is not needed, as the getter method is defined
# automatically via att_reader :balance in line 8.


puts
#==============================================================================#
puts "Question 2"

# Alyssa created the following code to keep track of items for a shopping cart
# application she's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alan looked at the code and spotted a mistake. "This will fail when
# update_quantity is called", he says.
#
# Can you spot the mistake and how to address it?

# A) in line 50 since it is not specified that quantity is the getter method,
# ruby interpreter by default will initialize a local variable named quantity
# and assign the updated_count value to it -- as opposed to assigning the value
# to the instance variable @quantity, which is the presumed purpose of the
# method.

# In order to fix the problem, the left-hand-side on line 50 should change to
# @quantity. Alternatively, we could change attr_reader to attr_accessor for the
# ivar @quantity and then change the LHS on line 50 to self.quantity.

puts
#==============================================================================#
puts "Question 3"

# In the last question Alyssa showed Alan this code which keeps track of items
# for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# Alan noticed that this will fail when update_quantity is called. Since
# quantity is an instance variable, it must be accessed with the @quantity
# notation when setting it. One way to fix this is to change attr_reader to
# attr_accessor and change quantity to self.quantity.
#
# Is there anything wrong with fixing it this way?

# A) since the logic of the application dictates avoiding of negative values for
# ivar @quantity, having an implicit setter method would violate this logic as
# @quantity can now be set to negative values by invoking the setter method
# directly.

puts
#==============================================================================#
puts "Question 4"

# Let's practice creating an object hierarchy.
#
# Create a class called Greeting with a single method called greet that takes a
# string argument and prints that argument to the terminal.
#
# Now create two other classes that are derived from Greeting: one called Hello
# and one called Goodbye. The Hello class should have a hi method that takes no
# arguments and prints "Hello". The Goodbye class should have a bye method to
# say "Goodbye". Make use of the Greeting class greet method when implementing
# the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye
# classes.

class Greeting
  def greet(str)
    puts str
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

Greeting.new.greet("hello goodbye")
Hello.new.hi
Goodbye.new.bye

# hello goodbye
# Hello
# Goodbye

puts
#==============================================================================#
puts "Question 5"

# You are given the following class that has been implemented:

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    str1 = @filling_type.nil? ? "Plain" : @filling_type
    str2 = @glazing.nil? ? "" : " with #{@glazing}"
    str1 + str2
  end
end

# And the following specification of expected behavior.
# Write additional code for KrispyKreme such that the puts statements will work
# as specified above.

# A) We need to define a to_s method, so printing the objects will output the
# properties. (lines 155-159)

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  # => "Plain"

puts donut2
  # => "Vanilla"

puts donut3
  # => "Plain with sugar"

puts donut4
  # => "Plain with chocolate sprinkles"

puts donut5
  # => "Custard with icing"


puts
#==============================================================================#
puts "Question 6"

# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# A) in the first case #create_template method initializes and sets the value of
# the instance variable @template, with #show_template method calling the getter
# function for @template and returning the value.

# In the second case,#create_template invokes the setter method for @template
# instead of directly assigning the ivar value. The #show_template method still
# calls the getter method for @template, albeit more explicitly this time by
# using the prefix self to signify the getter method use.

puts
#==============================================================================#
puts "Question 7"

# How could you change the method name below so that the method name is more
# clear and less repetitive.

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "I want to turn on the light with a brightness level of super high and a /
    colour of green"
  end
end

# A) One could change the name of the class method from #light_information to
# simply #information, as the class name represents the subject matter and we
# could avoid using repetitive constructs like Ligh.light_information.
