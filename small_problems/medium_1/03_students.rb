=begin

Students

Below we have 3 classes: Student, Graduate, and Undergraduate. Some details for
these classes are missing. Make changes to the classes below so that the
following requirements are fulfilled:

    Graduate students have the option to use on-campus parking, while
    Undergraduate students do not.

    Graduate and Undergraduate students have a name and year associated with
    them.

Note, you can do this by adding or altering no more than 5 lines of code.

=end

# A) we can have both Graduate and Undergraduate classes inherit from Student,
# and add the parking functionality to the Graduate initialize method:

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student # (1)
  def initialize(name, year, parking)
    super(name, year) # (2)
    @parking = parking # (3)
  end
end

class Undergraduate < Student # (4)
  def initialize(name, year)
    super # (5)
  end
end

# Further Exploration

# There is one other "form" of the keyword super. We can call it as super().
# This calls the superclass method of the same name as the calling method, but
# here no arguments are passed to the superclass method at all.

# Can you think of a way to use super() in another Student related class?

# A) super() is useful when we want to invoke the inherited method with no (or
# default) arguments. E.g. #display method below:

class Student2
  # ...
  def display
    puts "name: #{@name}"
    puts "year: #{@year}"
  end
end

class Graduate2 < Student2
  # ...
  def display(diss_title)
    super()
    puts "parking: #{@parking}"
    puts "dissertation title: #{diss_title}"
  end
end
