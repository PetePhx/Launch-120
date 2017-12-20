# Let's add a to_s method to the class:

class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
    @first_name = n.split(' ')[0]
    @last_name = n.split(' ')[1].nil? ? '' : n.split(' ')[1]
  end

  def name
    first_name + ' ' + last_name
  end

  def name=(n)
    if n.split(' ').size == 1
      @first_name = n
      @last_name = ''
    else
      @first_name = n.split(' ')[0]
      @last_name = n.split(' ')[1..-1].join(' ') #in case the last name has spaces
    end
  end

  def same_name?(other)
    self.name == other.name
  end

  def to_s
    name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
#  The person's name is: Robert Smith
