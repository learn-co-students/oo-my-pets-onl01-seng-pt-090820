class Owner
  attr_reader :species, :name
  attr_accessor :pets, :dog, :cat

  @@all = []
  @@pets = {:dogs => [], :cats => []}

  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def pets
    @@pets
  end
  
  def cats
    Cat.all.select do |kitty|
      kitty.owner == self
    end
  end
  
  def dogs
    Dog.all.select do |doggo|
      doggo.owner == self
    end
  end
  

  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood= "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood= "happy"
    end
  end

  def sell_pets
    self.cats.each do |cat|
      cat.mood= "nervous"
      cat.owner= nil 
    end
    self.dogs.each do |dog|
      dog.mood= "nervous"
      dog.owner= nil
    end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end  