=begin

Nobility

Now that we have a Walkable module, we are given a new challenge. Apparently
some of our users are nobility, and the regular way of walking simply isn't good
enough. Nobility need to strut.

We need a new class Noble that shows the title and name when walk is called:

We must have access to both name and title because they are needed for other
purposes that we aren't showing here.

=end

# A) We modify #walk to print the proper name, which is the same as name for all
# calsses except Noble, which outputs title + name. 

module Walkable
  def walk
    puts "#{proper_name} #{gait} forward."
  end

  def proper_name
    "#{name}"
  end
end

class Noble
  include Walkable
  attr_reader :name, :title

  def initialize(nm, ttl)
    @name = nm
    @title = ttl
  end

  def proper_name
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"

puts byron.name
# => "Byron"
puts byron.title
# => "Lord"
