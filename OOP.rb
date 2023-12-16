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

# ENCAPSULATION explanation - https://www.youtube.com/watch?v=SwAkGw4K8D4&t=87s

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

obj.public_method_with_self_private
obj.public_method_with_self_protected

# obj.private_method # => NoMethodError
# obj.protected_method # => NoMethodError

sub_obj = MySubclass.new
sub_obj.subclass_method # => "This is a protected method"
sub_obj.another_method # => "This is a private method"
