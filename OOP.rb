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
