# First case -------------------------

class Animal
  def eat
    puts "eating"
  end
end

class Cat < Animal
  def eat
    super
  end
end

puts "--- Cat class ---------"
puts Cat.new.eat                         # eating

# Second case -------------------------

class Dog
  def eat(food)
    puts "eating #{food}"
  end
end

puts "--- Dog class ---------"
puts Dog.new.eat("a bone")               # eating a bone

puts "--- GermanShepherd class ---------"

class GermanShepherd < Dog
  def eat(food)
    super(food)
  end
end

puts GermanShepherd.new.eat("meat")      # eating meat

# Third case -------------------------

class Person
  def eat(dish)
    puts "eating #{dish}"
  end
end

puts "--- Person class ---------"
puts Person.new.eat("porridge")          # eating porridge

class John < Person
  def eat(dish, second_dish)
    super(dish)
    puts "eating #{second_dish} as well"
  end
end

puts "--- John class ---------"
puts John.new.eat("porridge", "baked turkey")       # eating porridge / eating baked turkey as well
