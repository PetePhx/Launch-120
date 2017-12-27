=begin

Fix the Program - Flight Data

Consider the following class definition:

There is nothing technically incorrect about this class, but the definition may
lead to problems in the future. How can this class be fixed to be resistant to
future problems?

=end

# Since the ivar database_handle deals with the back-end implementation and
# interaction with the DB, and since we don't need explicit setter/getter
# methods for @database_handle, the attr_accessor is unnecessary, and can lead
# to future problems if a buggy code accesses the ivar and causes inadvertant
# change or deletion in the database.

class Flight
  # attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end
