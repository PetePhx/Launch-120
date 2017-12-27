=begin

Fix the Program - Books (Part 2)

Complete this program so that it produces the expected output.

=end

# A) We set attribute accessors for ivars @tite, @author.

class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Expected output:
#
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration

# What do you think of this way of creating and initializing Book objects? (The
# two steps are separate.) Would it be better to create and initialize at the
# same time like in the previous exercise? What potential problems, if any, are
# introduced by separating the steps?

# A) The second approach provides us with the freedom to create Book objects
# with partial and no information, and complete the object info at a later
# time. It also introduces the risk that the information might be inadvertantly
# at a later time due to an erroneous assignment.
