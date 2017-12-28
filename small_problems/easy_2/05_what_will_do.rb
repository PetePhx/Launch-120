=begin

What Will This Do?

What will the following code print?

=end

# The code in class Something initializes the instance variable @data to 'Hello',
# with the instance method #dupdata returning @data self concatanated, i.e.
# 'HelloHello', and the class method #dupdata returning 'ByeBye'.
# The code outside the class instantiates the object thing from Somthing class,
# invokes the class method #dupdata (ByeBye), and then invokes the instance
# method #dupdata on the object thing (HelloHello).

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata
# ByeBye
# HelloHello
