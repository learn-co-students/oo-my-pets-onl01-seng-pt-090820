require 'pry'
class Owner
  
  attr_accessor :dog, :cat
  attr_reader :name 
  
  @@all = []
  
  
  def initialize(name)
    @name = name 
    save
  end 
  
  def species 
    "human"
  end 
  
  def say_species 
    "I am a human."
  end 
  
def save 
  @@all << self
end 

def self.all 
  @@all 
end 

def self.count 
  @@all.count 
end 

def self.reset_all 
  @@all.clear 
end 
  
  def cats 
    Cat.all.select {|cat| cat.owner == self }
  end 
  
   def dogs
    Dog.all.select {|dog| dog.owner == self }
  end 
  
  def buy_cat(name)
   Cat.new(name,self)
  end
  
  def buy_dog 
  end
  
  def walk_dogs 
    Dog.mood = "happy"
  end 
  
end