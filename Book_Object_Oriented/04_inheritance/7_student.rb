# Create a class 'Student' with attributes name and grade. Do NOT make the grade
# getter public, so joe.grade will raise an error. Create a better_grade_than?
# method, that you can call like so...

# puts "Well done!" if joe.better_grade_than?(bob)

class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(other)
    @grade > other.grade
  end

  protected

  def grade
    @grade
  end
end

bob = Student.new("bob", 90)
joe = Student.new("joe", 85)

p joe.better_grade_than?(bob)
p bob.better_grade_than?(joe)

# p bob.grade
