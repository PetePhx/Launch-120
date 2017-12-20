# Now create a smart name= method that can take just a first name or a full
# name, and knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
    @first_name = n.split(' ')[0]
    @last_name = n.split(' ')[1].nil? ? '' : n.split(' ')[1]
  end

  def name
    first_name + ' ' + last_name
  end

  def name=(n)
    if n.split(' ').size == 1
      @first_name = n
      @last_name = ''
    else
      @first_name = n.split(' ')[0]
      @last_name = n.split(' ')[1..-1].join(' ') #in case the last name has spaces
    end
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

bob.name = "John Quincy Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Quincy Adams'
