class Owner
  attr_reader :species, :name
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}." 
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
  
  def cats 
    all_cats = []
    Cat.all.each {|pet|
      if pet.is_a?(Cat) && pet.owner == self
        all_cats << pet
      end
    }
    all_cats
  end
  
  def dogs 
    all_dogs = []
    Dog.all.each {|pet|
      if pet.is_a?(Dog) && pet.owner == self
        all_dogs << pet
      end
    }
    all_dogs
  end
  
  def buy_cat(name)
    cat = Cat.new(name, self)
  end
  
  def buy_dog(name)
    dog = Dog.new(name, self)
  end
  
  def walk_dogs 
    Dog.all.each {|pet|
      if pet.is_a?(Dog) && pet.owner == self
        pet.mood = "happy"
      end
    }
  end
  
  def feed_cats 
    Cat.all.each {|pet|
      if pet.is_a?(Cat) && pet.owner == self
        pet.mood = "happy"
      end
    }
  end 
  
  def sell_pets
    Cat.all.each {|pet|
      if pet.is_a?(Cat) && pet.owner == self
        pet.mood = "nervous"
        pet.owner = nil
      end
    }
    Dog.all.each {|pet|
      if pet.is_a?(Dog) && pet.owner == self
        pet.mood = "nervous"
        pet.owner = nil
      end
    } 
    
    
    
    
    
  end 
  
  def list_pets
    dog_num = 0 
    cat_num = 0
    Cat.all.each {|pet|
      if pet.is_a?(Cat) && pet.owner == self
        cat_num += 1
      end
    }
    Dog.all.each {|pet|
      if pet.is_a?(Dog) && pet.owner == self
        dog_num += 1
      end
    }
    "I have #{dog_num} dog(s), and #{cat_num} cat(s)."
  end 
  
  
  
  
  

end