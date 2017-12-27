=begin

Fix the Program - Persons

Complete this program so that it produces the expected output:

=end

# A) since we need both getter and setter methods for both ivars, attr_reader
# should do the trick for reading. For setting, we need capitalization, hence
# the custom-made setter methods.

class Person
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def first_name=(str)
    @first_name = str.capitalize
  end

  def last_name=(str)
    @last_name = str.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person

# Expected output:
#
# John Doe
# Jane Smith
