require './elections_modules.rb'
require './voting_modules.rb'
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

  @percentage_results = {}

  results.each do |key, value|
    candidate_results = "#{key.to_s} --- #{value.to_f / result_number * 100}%"

    puts candidate_results

    @percentage_results[key] = value.to_f / result_number * 100
  end

  elections_winner = @percentage_results.find { |key, value| value > 50 } # get a candidate with more than 50% of votes

  if elections_winner
    puts "The first round of elections is over"
    puts "Candidate that have got more than 50% \n---> #{elections_winner[0]} with #{elections_winner[1]} votes"
  else
    puts "The first round of elections is over. The second round of elections is announced"
  end
end
