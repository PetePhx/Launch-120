# objects are usually created using the #new method of a class to instantiate a
# new instance of that class (with a few exceptions: Integer, NilClass, etc.)

class SomeClass
end

some_object = SomeClass.new
p some_object.class #SomeClass
