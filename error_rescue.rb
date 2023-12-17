# site with explanation https://www.mintbit.com/blog/error-handling-in-ruby-exception-handling-and-best-practices

def add(*args)
  puts args.sum
end

add(1, 2, 3, 4)

def division(*a, b)
  begin # <------ that's what we call error handling
  puts a.sum / b
  rescue ZeroDivisionError => e
    puts "An error occurred: #{e.message}"
  end
end

division(1, 0)
