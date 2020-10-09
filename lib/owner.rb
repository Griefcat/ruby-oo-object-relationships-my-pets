require "pry"
class Owner

@@all = []

attr_reader :name, :species

def initialize(name)
  @name = name
  @species = "human"
  self.class.all << self 
end 

def say_species
  "I am a #{self.species}."
end 

def cats
  Cat.all.select do |cat|
    cat.owner == self
  end
end

def dogs
  Dog.all.select do |dog|
    dog.owner == self
  end
end

def buy_cat(name)
  cat = Cat.new(name,self)
end 

def buy_dog(name)
  dog = Dog.new(name,self)
end 

def self.all
  @@all
  
end

def self.count
  self.all.count
end 

def self.reset_all
  self.all.clear
end 

def walk_dogs
  self.dogs.each do |dog|
    dog.mood = "happy"
  end 
end 

def feed_cats 
  self.cats.each do |cat|
    cat.mood = "happy"
  end 
end 



def sell_pets
  self.dogs.each do |dog|
    dog.mood = "nervous"
    dog.owner = nil
  end 
  self.cats.each do |cat|
    cat.mood = "nervous"
    cat.owner = nil
  end 
end 

def list_pets
  return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end 

end 