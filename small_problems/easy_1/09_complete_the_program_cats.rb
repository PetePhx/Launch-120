=begin

Complete the Program - Cats!

Consider the following program.

Update this code so that when you run it, you see the following output:

My cat Pudding is 7 years old and has black and white fur.
My cat Butterscotch is 10 years old and has tan and white fur.

=end

# A) we update the initialize method, as well as write a custom-made to_s method
# to override the default to_s behavior.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Further Exploration

# An alternative approach to this problem would be to modify the Pet class to
# accept a colors parameter. If we did this, we wouldn't need to supply an
# initialize method for Cat.

# Why would we be able to omit the initialize method? Would it be a good idea to
# modify Pet in this way? Why or why not? How might you deal with some of the
# problems, if any, that might arise from modifying Pet?

# A) If we had identical initialize method for Cat and Pet, then having it in
# Cat would be unnecessary, as the behavior is already inherited. The problem
# would arise if there are other descendant classes from Pet that are 
# initialized using only two parameters, and this would result on the dependent
# code to malfunction. One fix would be to make the color parameter optional,
# or just update all the occurences of the dependent classes in the code base.
