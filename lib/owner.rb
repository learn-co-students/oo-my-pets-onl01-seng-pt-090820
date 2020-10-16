class Owner
  attr_reader :name, :species  
  @@all = []
  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self 
  end
  def cats 
    Cat.all.select { |element| element.owner == self }
  end 
  def dogs 
    Dog.all.select { |element| element.owner == self }
  end 
  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name, self)
    
  end 
  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name, self) 
  end 
  def walk_dogs
    self.dogs.each do |element| 
      element.mood = "happy"
    end 
  end 
  def feed_cats 
    self.cats.each do |element|
      element.mood = "happy"
    end 
  end
  def sell_pets 
    self.dogs.each do |element|
      element.mood = "nervous"
      element.owner = nil 
    end 
    self.cats.each do |element|
      element.mood = "nervous"
      element.owner = nil 
    end 
  end
  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
  
  
  def say_species 
    "I am a human."
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
  
end
