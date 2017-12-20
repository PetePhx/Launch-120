# What is the method lookup path and how is it important?

# The method lookup path is the order in which the ancestor classes and mixin
# modules of a class are searched in a method invocation.

# For the BullDog class below, we have:

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class BullDog < Dog
  def swim
    'can\'t swim! help!'
  end
end

p BullDog.ancestors
# [BullDog, Dog, Object, Kernel, BasicObject]
