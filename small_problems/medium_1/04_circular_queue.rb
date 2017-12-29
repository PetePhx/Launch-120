=begin

Circular Queue

Your task is to write a CircularQueue class that implements a circular queue for
arbitrary objects. The class should obtain the buffer size with an argument
provided to CircularQueue::new, and should provide the following methods:

    enqueue to add an object to the queue

    dequeue to remove (and return) the oldest object in the queue. It should
    return nil if the queue is empty.

You may assume that none of the values stored in the queue are nil (however, nil
may be used to designate empty spots in the buffer).

=end

class CircularQueue
  def initialize(size)
    @size = size
    @arr = []
  end

  def enqueue(obj)
    @arr.rotate!.pop if @arr.size == @size
    @arr.push obj
  end

  def dequeue
    @arr.rotate!.pop
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# Further Exploration

# However, there is a simpler solution that uses an Array, and the #push and
#shift methods. See if you can find a solution that does this.

# A) the action of #rotate! followed by #pop as used above is equivalent to
# #shift.
