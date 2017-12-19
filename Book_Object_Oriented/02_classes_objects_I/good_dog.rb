class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall!"
  end

  def speak
    "#{name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky", '6 feet', '300 pounds')
puts sparky.speak
puts sparky.name
puts sparky.info

sparky.change_info('Sparcke', '240 inches', '450s lbs')
puts sparky.name
puts sparky.info

# fido = GoodDog.new("Fido")
# puts fido.speak

  # def name
  #   @name
  # end
  #
  # def name=(n)
  #   @name = n
  # end
