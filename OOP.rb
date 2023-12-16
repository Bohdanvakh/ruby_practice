# OOP in ruby example code

# https://medium.com/launch-school/the-basics-of-oop-ruby-26eaa97d2e98

# Ruby is an object-oriented programming language (OOP) that uses classes as blueprints for objects. Objects are
# the basic building-blocks of Ruby code (everything in Ruby is an object), and have two main properties:
# states and behaviours.

# Abstraction, polymorphism, inheritance and encapsulation form four of the main pillars of OOP

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ABSTRACTION explanation - https://www.youtube.com/watch?v=SwAkGw4K8D4&t=87s

# In object-oriented programming (OOP), abstraction refers to the process of hiding the details of an object's
# implementation and highlighting only those aspects that are essential for interaction with other objects.
# Abstraction allows you to isolate complexity by defining an interface for interacting with an object and
# hiding the details of its internal implementation.

# In Ruby, abstraction can be achieved using classes and modules. Classes recommend the structure of such object
# behavior, and modules do not allow you to group functionality and include it in classes for needs.

class Fruit
  def initialize(name, color)
    @name = name
    @color = color
  end

  def show_fruit
    puts "This is #{@name} and it's #{@color}"
  end
end

apple = Fruit.new("apple", "red")
apple.show_fruit

# The abstraction here is that external code can use the apple object without knowing the
# details of its internal implementation.

# In particular, modules in Ruby also allow for abstraction, allowing their functionality to be
# included in classes and other objects.

# We concern ourselves with a higher-level sense of the problem without worrying about implementation details like
# binary code or whether the code will run on a specific operating system. This allows us to restrict our focus
# to objects with properties (states) and behaviours (methods).

puts "\n/////////////////////////////////////"
puts "\n"
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ENCAPSULATION

# Public

puts "\n /// Public methods"
puts "\n"

class Animal
  def initialize(name, action)
    @name = name
    @action = action
  end

  def intruduction # this method is public and we can call it
    puts "Hello, my name is #{@name}"
  end

  def action # this method is public and we can call it
    puts "Usually I do #{@action}"
  end
end

dog = Animal.new("Robert", "woof-woof")

dog.intruduction
dog.action

# Private

puts "\n /// Private methods"
puts "\n"

class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def intruduction
    puts "Hello my friend"

    # We call private methods
    my_name
    my_breed
  end

  private

  def my_name # private methon
    puts "My name is #{@name}"
  end

  def my_breed # private methon
    puts "I'm a #{@breed}"
  end
end

my_dog = Dog.new("Bob", "German Shepherd")
my_dog.intruduction

# Protected

puts "\n /// Protected methods"
puts "\n"

class Cow
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def intruduction
    say_hi
    puts "My name is #{@name}"
    my_breed
  end

  private

  def say_hi
    puts "Hi"
  end

  protected

  def my_breed
    puts "I'm a #{@breed} cow"
  end
end

my_old_cow = Cow.new("Starlight", "Simmental cattle")
my_old_cow.intruduction

class MyCow < Cow
  def say_me_hi
    say_hi
  end

  def say_my_breed
    my_breed
  end
end

my_cow = MyCow.new("Flower", "Holstein")
# my_cow.say_hi # => wa cant call private method from subclass (NoMethodError)
# my_cow.my_breed # => wa cant call protected method from subclass (NoMethodError)
# my_cow.my_breed # => NoMethodError
my_cow.say_me_hi
my_cow.say_my_breed

###

class MyClass
  def public_method
    puts "This is a public method"

    private_method   # wa can call private method in public
    protected_method #wa can call protected method in public
  end

  def public_method_with_self_private
    puts "public_method_with_self_private <<<<<<<<<<<<<"

    self.private_method  # wa can call private method in public
  end

  def public_method_with_self_protected
    puts "public_method_with_self_protected <<<<<<<<<<<<<"

    # private_method   # wa can call private method in public
    self.protected_method
  end

  private

  def private_method
    puts "This is a private method"
  end

  protected

  def protected_method
    puts "This is a protected method"
  end
end

class MySubclass < MyClass
  def subclass_method
    protected_method
  end

  def another_method
    private_method
  end
end

puts "\nExample provided by bing chat (not bad) -------------------------------------------------"
puts "\n"

obj = MyClass.new
obj.public_method

# Since Ruby 2.7 Ruby 2.7+ allows private methods to be called with self as receiver

obj.public_method_with_self_private
obj.public_method_with_self_protected

# obj.private_method # => NoMethodError
# obj.protected_method # => NoMethodError

sub_obj = MySubclass.new
sub_obj.subclass_method # => "This is a protected method"
sub_obj.another_method # => "This is a private method"

puts "\n/////////////////////////////////////"
puts "\n"
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# POLYMORPHISM using inheritance

# explanation ---------------------> https://www.geeksforgeeks.org/polymorphism-in-ruby/

class Vehicle
  def tyreType
    puts "Heavy Car"
  end
end

class Car < Vehicle
  def tyreType
    puts "Small Car"
  end
end

class Truck < Vehicle
  def tyreType
    puts "Big Car"
  end
end

vehicle = Vehicle.new
vehicle.tyreType

vehicle = Car.new
vehicle.tyreType

vehicle = Truck.new
vehicle.tyreType

puts "~~~~~~~~~"

# POLYMORPHISM using Duck-Typing

class Hotel
  def enters
    puts "A customer enters"
  end

  def type(customer)
    customer.type
  end

  def room(customer)
    customer.room
  end
end

class Single
  def type
    puts "Room is on the fourth floor."
  end

  def room
    puts "Per night stay is 5 thousand"
  end
end

class Couple
  def type
    puts "Room is on the second floor."
  end

  def room
    puts "Per night stay is 8 thousand"
  end
end

hotel = Hotel.new
puts "This visitor is Single. <====="
customer = Couple.new
hotel.type(customer)
hotel.room(customer)

puts "This visitor is Couple. <====="
customer = Single.new
hotel.type(customer)
hotel.room(customer)

puts "\n/////////////////////////////////////"
puts "\n"
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# INHERITANCE explanation -------------> https://www.geeksforgeeks.org/ruby-inheritance/

class GeeksforGeeks
  def initialize
      puts "This is Superclass"
  end

  def super_method
      puts "Method of superclass"
  end
end

class Sudo_Placement < GeeksforGeeks
  def initialize
     puts "This is Subclass"
  end
end

GeeksforGeeks.new
sub_obj = Sudo_Placement.new
sub_obj.super_method

puts "\n/////////////////////////////////////"
puts "\n"
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
