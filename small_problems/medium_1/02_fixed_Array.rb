=begin

Fixed Array

A fixed-length array is an array that always has a fixed number of elements.
Write a class that implements a fixed-length array, and provides the necessary
methods to support the following code:

The above code should output true 15 times.

=end

class FixedArray
  def initialize(length)
    @length = length
    (0...@length).each do |idx|
      eval "@x_#{idx} = nil"
    end
  end

  def [](idx)
    idx = normalize_index(idx)
    check_index(idx)
    eval "@x_#{idx}"
  end

  def []=(idx, obj)
    idx = normalize_index(idx)
    check_index(idx)
    eval "@x_#{idx} = " + "#{obj}".inspect
  end

  def normalize_index(idx)
    idx < 0 ? @length + idx : idx
  end

  def check_index(idx)
    raise IndexError if idx >= @length || idx < 0
  end

  def to_a
    arr = []
    (0...@length).each do |idx|
      eval "arr << @x_#{idx}"
    end
    arr
  end

  def to_s
    self.to_a.to_s
  end

end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
