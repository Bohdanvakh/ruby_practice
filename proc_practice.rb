require 'pry-rails'

class MyObject
    attr_accessor :size

    def initialize(size)
        @size = size
    end

    def implement_walues
        double = proc { @size * 2 }
        triple = proc { @size * 3 }

        puts (double << triple).call
    end

    def another_implement_values(size) # with params
        double = proc { |size| size * 2 }
        triple = proc { |size| size * 3 }

        new_value = (double << triple).call(size)

        puts("this value was #{size}, but we * 2 and then * 3 and new value is = #{new_value}")
    end
end
