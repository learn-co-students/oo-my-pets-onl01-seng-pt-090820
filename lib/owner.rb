require 'pry'

class Owner
  
  #attr_accessor :cats, :dogs
  attr_reader :species, :name

  @@owners = []

def initialize(name)
    @name = name
    @species = "human"
    @@owners << self
    #@dogs = []
    #@cats = []
  end

  def self.all
    @@owners
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def say_species
    "I am a #{@species}."
  end
  
  def dogs 
    Dog.all.select{|o| o.owner == self}
  end 
  
  def cats 
    Cat.all.select{|o| o.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    #binding.pry
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil 
    end
    
  end
  
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end