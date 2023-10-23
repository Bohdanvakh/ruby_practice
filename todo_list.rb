class Todo
    attr_accessor :title, :description, :time

    @@all_records = []

    def initialize(title, description, time)
        @title = title
        @description = description
        @time = time

        @@all_records << self
    end

    def self.show_all_records
        puts "All records number: #{@@all_records.count}"

        @@all_records&.each do |record|
            puts "Title: #{record.title}"
            puts "Description: #{record.description}"
            puts "Time: #{record.time.strftime("%d/%m/%Y")}"
            puts "---------------------------------------"
        end
    end
end
