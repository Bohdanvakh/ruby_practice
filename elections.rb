require './elections_modules.rb'
require 'pry'
require 'json'

class Main
  include SaveToJson
  include ToHash
end

class Candidate < Main
  attr_accessor :first_name, :last_name, :political_party

  def initialize(first_name, last_name, political_party)
    @first_name = first_name
    @last_name = last_name
    @political_party = political_party

    attributes = { first_name: first_name, last_name: last_name, political_party: political_party }

    save_to_json('candidates.json', attributes)
  end
end

class Person < Main
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name

    attributes = { first_name: first_name, last_name: last_name }

    save_to_json('people.json', attributes)
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
