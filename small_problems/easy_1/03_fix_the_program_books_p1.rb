=begin

Fix the Program - Books (Part 1)

Complete this program so that it produces the expected output.

=end

# We add attribute readers for ivars @author, @title

class Book
  attr_reader :author, :title
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Expected output:

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration

# A) Since the tests only deal with getting the title and author for book
# objects and not setting them, attr_reader is sufficient, although
# attr_accessor would work as well. The explicit getter methods given for ivars
# are equivalent to attr_reader, so they work too.

# def title
#  @title
# end
#
# def author
#  @author
# end
