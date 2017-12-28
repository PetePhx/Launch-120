=begin

Fix The Program - Expander

What is wrong with the following code? What fix(es) would you make?

=end

# The method #to_s is calling the private method expand with a self prefix,
# which raises a NoMethodError exception. The easiest fix would be to invoke
# #expand without the self keyword prefixed:

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    # self.expand(3)
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander
# xyzxyzxyz
