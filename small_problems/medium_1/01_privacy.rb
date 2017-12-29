=begin

Privacy

Consider the following class.

Modify this class so both flip_switch and the setter method switch= are private
methods.

=end

# The following changes are made: #attr_writer and #flip_switch are moved to the
# private section; self keyword is removed from #flip_switch invokations.

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private
  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

m = Machine.new
m.start
p m
m.stop
p m
#<Machine:0x00005648dcb54390 @switch=:on>
#<Machine:0x00005648dcb54390 @switch=:off>

# Further Exploration

# Add a private getter for @switch to the Machine class, and add a method to
# Machine that shows how to use that getter.

# we place the attr_reader in the private section, and define #status instance
# method that invokes the getter without the self keyword.

class Machine2
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def status
    switch
  end

  private
  attr_writer :switch
  attr_reader :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

m = Machine2.new
m.start
p m
m.stop
p m
puts m.status
#<Machine2:0x000056112fc8e7b8 @switch=:on>
#<Machine2:0x000056112fc8e7b8 @switch=:off>
# off
