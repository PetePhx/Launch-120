=begin

Pet Shelter

Consider the following code. Write the classes and methods that will be
necessary to make this code run, and print the following output.
The order of the output does not matter, so long as all of the information is
presented.

P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.

=end

class Pet
  attr_reader :species, :name
  def initialize(species, name)
    @species = species
    @name = name
  end
end

class Owner
  attr_reader :name
  attr_accessor :pets_arr

  def initialize(str)
    @name = str
    @pets_arr = []
  end

  def number_of_pets
    @pets_arr.size
  end
end

class Shelter
  attr_accessor :owners_hsh
  def initialize
    @owners_hsh = {}
  end

  def adopt(owner, pet)
    @owners_hsh[owner.name] = owner.pets_arr << pet
  end

  def print_adoptions
    @owners_hsh.each do |owner_name, pets_arr|
      puts "#{owner_name} has adopted the following pet(s):"
      pets_arr.each do |pet|
        puts "a #{pet.species} named #{pet.name}"
      end
      puts
    end
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


# Further Exploration

# Add your own name and pets to this project.

# Suppose the shelter has a number of not-yet-adopted pets, and wants to manage
# them through this same system. Thus, you should be able to add the following
# output to the example output shown above:

# ...
# The Animal shelter has 7 unadopted pets.

# A) For this case we need another array of pets for the shelter to represent
# unadopted pets. The process of adoption then should remove any given pet from
# the unadopted array and add it to the given owner's pet array. We also add an
# instance method to add an unadopted pet to the array: #receive_pet

class Shelter2
  attr_accessor :owners_hsh
  attr_accessor :unadopted_arr

  def initialize
    @owners_hsh = {}
    @unadopted_arr = []
  end

  def receive(pet)
    @unadopted_arr << pet
  end

  def adopt(owner, pet)
    @unadopted_arr.delete(pet)
    @owners_hsh[owner.name] = owner.pets_arr << pet
  end

  def print_adoptions
    @owners_hsh.each do |owner_name, pets_arr|
      puts "#{owner_name} has adopted the following pet(s):"
      pets_arr.each do |pet|
        puts "a #{pet.species} named #{pet.name}"
      end
      puts
    end
  end

  def print_unadopted
    puts "The Animal shelter has #{unadopted_arr.size} unadopted pet(s)."
  end
end

shelter = Shelter2.new
mr_claws = Pet.new('cat', 'mr. claws')
shelter.receive(mr_claws)
shelter.print_unadopted
# The Animal shelter has 1 unadopted pet(s).
