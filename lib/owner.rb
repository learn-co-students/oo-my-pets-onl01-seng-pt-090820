require "pry"

class Owner
  

  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name, species = "human")
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    return "I am a #{@species}."
  end
  
  def self.all
    return @@all
  end
  
  def self.count
    self.all.count
  end
  
  def self.reset_all
    self.all.clear
  end
  
 ##associations
  
  def cats
    Cat.all.select do |cats|
      cats.owner == self
    end
  end
  
  def dogs
    Dog.all.select do |dogs|
      dogs.owner == self
    end
  end
  
  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end
  
  
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end
    
  def walk_dogs
    Dog.all.select do |dogs|
      dogs.mood = "happy"
    end
  end
  
  def feed_cats
    Cat.all.select do |cats|
      cats.mood = "happy"
    end
  end
  
  def sell_pets
    Cat.all.select do |cats|
      cats.mood = "nervous"
      #binding.pry
      cats.owner = nil
  end
    Dog.all.select do |dogs|
      dogs.mood = "nervous"
      dogs.owner = nil
    end
  end

  def list_pets
    dog_count = self.dogs.count
    cat_count = self.cats.count
    "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
    
  end

end