=begin

Reverse Engineering

Write a class that will display:

ABC
xyz

when the following code is run:

=end

# A) we define the following instance and class methods for uppercase and
# lowercase actions, respectively:

class Transform
  def initialize(str)
    @string = str
  end

  def uppercase
    @string.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

# Further Exploration

# A class method is also, somewhat confusingly, called a "singleton method" (the
# term is used in other contexts as well). We don't recommend learning the
# details at this time - it may be more confusing than it is helpful - but you 
# should be aware that you may encounter this term.
