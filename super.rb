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
    super
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

# Fourth case

class King
  def owns
    "The king owns the kingdom!"
  end
end

puts "--- King class ---------"
puts King.new.owns                       # The king owns the kingdom!

class People < King
  def owns(message)
    super()
  end
end

puts "--- People class ---------"
puts People.new.owns("People own nothing") # The king owns the kingdom!


# We can change parent method using yield 😮
# Super with blocks

class Message
  def message
    yield
  end
end

class Letter < Message
  def message
    super
  end
end

puts "--- Letter class ---------"
puts Letter.new.message { print "That is a Letter" } # That is a Letter

class Parent
  def greeting(name)
    puts "Hello, #{name}!"
  end
end

class Child < Parent
  def greeting(name)
    super  # calls the greeting method in the parent class
  end
end

child = Child.new
child.greeting("John")  # Hello, John!


class ParentTwo
  def greeting(name)
    puts "Hello, #{name}!"
  end
end

class ChildTwo < ParentTwo
  def greeting(name)
    # super()  # calls method greeting in the parent class without arguments (BUT IT WILL RETURN AN ERROR Wrong number of arguments)
    super(name)  # calls method greeting in the parent class with arguments
  end
end

child = ChildTwo.new
child.greeting("Logan")  # Hello, !
