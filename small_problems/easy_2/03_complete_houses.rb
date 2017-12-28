=begin

Complete The Program - Houses

Assume you have the following code, and this output.

Home 1 is cheaper
Home 2 is more expensive

Modify the House class so that the above program will work. You are permitted to
define only one new method in House.

=end

# A) by using the Comparable module

class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    self.price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# Further Exploration

# Is the technique we employ here to make House objects comparable a good one?
# (Hint: is there a natural way to compare Houses? Is price the only criteria
# you might use?) What problems might you run into, if any? Can you think of any
# sort of classes where including Comparable is a good idea?

# A) This will work as long as the prices are defined using the same currency.
# There is also the possibility that one might want to compare according to
# other cruteria, e.g. area, number of floors, number of rooms, bathrooms, etc.
