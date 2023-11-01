# Single Inheritance

class Parent
end

class Child < Parent
end

puts Child.ancestors
puts "------------------------------"

# Child
# Parent
# Object
# PP::ObjectMixin
# Kernel
# BasicObject

# Multiple Inheritance

module MyModule
end

module OtherModule
end

class MyObject
  include MyModule
  include OtherModule
end

puts MyObject.ancestors
puts "------------------------------"

# MyObject
# OtherModule
# MyModule
# Object
# PP::ObjectMixin
# Kernel
# BasicObject

# It is better to use inheritance when your hierarchy represents an IS-A relationship.
# Inheritance is a great choice if your object already has a single responsibility...
# ...and you really just want specializations.

# Composition

class Move
  def step
    puts "step step step"
  end
end

class Doing
end

class Person
  def initialize
    @move = Move.new
  end

  def do_step
    @move.step
  end
end

person = Person.new
puts person.do_step

# It is better to use composition when your hierarchy represents a HAS-A relationship.
# Composition breaks up functionality into distinct responsibilities.
