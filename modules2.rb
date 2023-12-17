# One more amazing mudules practice file

# About modules ------> https://medium.com/rubycademy/modules-in-ruby-part-i-a2cdfaccdb6e

# A module is a collection of methods, variables, and constants stored in a container.
# It’s similar to a class but it cannot be instantiated.

module Greeting
  def hello
    puts 'Hello from Greeting module'
  end
end

module Desc
  def info
    puts 'Lorem ipsum dolor'
  end

  def hello
    puts 'Hello from Desc module'
  end
end

class Post
  include Greeting
  include Desc
end

print Post.ancestors

obj = Post.new
obj.hello # <====== returns value from Desc module

class Like
  prepend Greeting
  include Desc
end

obj = Like.new
obj.hello # <====== returns value from Greeting module

class Group
  extend Greeting
  include Desc
end

obj = Group.new
obj.hello # <====== returns value from Desc module
