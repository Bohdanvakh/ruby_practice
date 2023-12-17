# Using include

puts "--- include ---------"

module Greeting
  def hello
    puts "Hello man"
  end
end

class Person
  include Greeting
end

puts Person.new.hello                    # Hello man
print Person.ancestors                   # [Person, Greeting, Object, PP::ObjectMixin, Kernel, BasicObject] <== means that Greeting module methods are available

# Using prepend

puts "\n--- prepend ---------"

module Commentable
  def comment
    puts "Comment from the module"
  end
end

class Comment
  prepend Commentable     # to call a method from the module we use "prepend" if we have the same method in the our class
                          # for exapmle, if we use "include Commentable" and call the "comment" method we get "Comment from the class" 🙂
  def comment
    puts "Comment from the class"
  end
end

puts Comment.new.comment                 # Comment from the module
print Comment.ancestors                  # [Commentable, Comment, Object, PP::ObjectMixin, Kernel, BasicObject]

# Another example

module SwordModule
  def equipment
    super << "sword"
  end
end

class Knight
  prepend SwordModule

  def equipment
    %w[shield]
  end
end

puts "\n"

arthur = Knight.new
print arthur.equipment
puts "\n"

print Knight.ancestors

# Using extend

puts "\n--- extend ---------"

module SayHello
  def hello
    puts "Hello from the module"
  end
end

class SaySomething
  extend SayHello
end

puts SaySomething.hello                  # Hello from the module
print SaySomething.ancestors             # [SaySomething, Object, PP::ObjectMixin, Kernel, BasicObject]
