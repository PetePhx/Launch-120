# Modules are an alternative structure to class used for polymorphism. While a
# modules can not be used to create an object directly, we can mix in modules
# with classes so the classes will inherit the shared behavior belonging to the
# module.

# a contrived example:

module SomeModule
  def some_method(str)
    puts "#{'o' + str} #{'do' + str}!!!1"
  end
end

class SomeClass
  include SomeModule
end

class OtherClass
  include SomeModule
end

some_object = SomeClass.new
some_object.some_method('kie') # "okie dokie!!!1"

other_object = OtherClass.new
other_object.some_method('laf') # "olaf dolaf!!!1"
