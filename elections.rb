require 'pry'
require 'json'

class Candidate
  attr_accessor :first_name, :last_name, :political_party

  def initialize(first_name, last_name, political_party)
    @first_name = first_name
    @last_name = last_name
    @political_party = political_party

    save_to_json
  end

  private

  def save_to_json
    candidates_data = JSON.parse(File.read('candidates.json'))
    candidates_data << to_hash

    File.open('candidates.json', 'w') do |f|
      f.puts JSON.pretty_generate(candidates_data)
    end
  end

  def to_hash
    { first_name: @first_name, last_name: @last_name, political_party: @political_party }
  end
end

class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name

    save_to_json
  end

  private

  def save_to_json
    people_data = JSON.parse(File.read('people.json'))
    people_data << to_hash

    File.open('people.json', 'w') do |f|
      f.puts JSON.pretty_generate(people_data)
    end
  end

  def to_hash
    { first_name: @first_name, last_name: @last_name }
  end

  protected

  def self.create_electorate_list(file_path)
    json_data = File.read(file_path)
    data = JSON.parse(json_data)

    data.each do |first_name, last_name|
      Person.new(first_name, last_name)
    end
  end
end

def choose
  people = JSON.parse(File.read('people.json'))
  @elections = JSON.parse(File.read('elections.json'))

  people.each do |person|
    person_name = "#{person['first_name']} #{person['last_name']}"
    candidates = JSON.parse(File.read('candidates.json'))
    result_hash = { person: person_name, result: candidates.sample }

    @elections << result_hash
  end

  File.open('elections.json', 'w') do |f|
    f.puts JSON.pretty_generate(@elections)
  end
end

def see_results
  elections = JSON.parse(File.read('elections.json'))

  results = elections.group_by do |entry|
    "#{entry['result']['first_name']} #{entry['result']['last_name']}"
  end.transform_values(&:count).sort_by { |_, v| -v }

  result_number = elections.count
  puts "Elections results:"

  results.each do |key, value|
    puts "#{key.to_s} --- #{value.to_f / result_number * 100}%"
  end
end
