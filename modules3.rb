module SayHello
  def hi
    puts "Hi from the module"
  end
end

class Person
  include SayHello
end

Person.new.hi # it works well! what is we add method in the class?

class PersonTwo
  include SayHello

  def hi
    puts "Hi grom the class"
  end
end

PersonTwo.new.hi # it calls the class method. What it we prepend the module?

class PersonThree
  prepend SayHello

  def hi
    "Hi from the class"
  end
end

PersonThree.new.hi # as we expect it calls the method from the module. What about expent method?

class Student
  extend SayHello

  def hi
    puts "Hi from the student class"
  end
end

Student.new.hi # calls the class method
Student.hi # but we can call the module method as the class method (not instance method)
