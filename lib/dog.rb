class Dog
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

    def name_of_dog
      @name.dup.freeze
    end

    def mood
      @mood.dup.freeze
    end

    def self.all
      @@all
    end

   

end