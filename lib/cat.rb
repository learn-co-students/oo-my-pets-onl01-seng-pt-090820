class Cat
  attr_accessor :owner, :mood
  attr_reader :name 
  # code goes here
@@all = []

  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    @@all << self
  end

def name_of_cat
  @name.dup.freeze
end

def mood_of_dog
  @mood.dup.freeze
end

def self.all
  @@all
end



end