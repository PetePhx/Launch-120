class Parent
  def say_hi
    p "Hi from Parent."
  end
end

class Child < Parent
  def say_hi
    p "Hi from child."
  end

  # def send
  #   p "send from Child..."
  # end
end


p Parent.superclass
p Child.superclass

child = Child.new

child.send :say_hi
