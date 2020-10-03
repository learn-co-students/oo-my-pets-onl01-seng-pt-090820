require"pry"

class Owner
  attr_accessor :dogs, :cats
  attr_reader :name, :species
  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
      @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  #binding.pry
  def buy_cat(cat)
    Cat.new(cat, self)
  end

  #binding.pry
  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    Dog.all.each { |dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each { |cat| cat.mood = "happy"}
  end

  def sell_pets
    cats = Cat.all.select {|cat| cat.owner == self}
    cats.each {|cat| (cat.owner = nil) & (cat.mood = "nervous") }
    dogs = Dog.all.select {|dog| dog.owner == self}
    dogs.each {|dog| (dog.owner = nil) & (dog.mood = "nervous") }
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end