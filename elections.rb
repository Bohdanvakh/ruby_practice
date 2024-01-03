require './elections_modules.rb'
require 'pry'
require 'json'

class Main
  include ElectionsModule
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

class Elections < Main
  def choose
    people = JSON.parse(File.read('people.json'))
    @elections = JSON.parse(File.read('elections.json'))

    people.each do |person|
      person_name = "#{person['first_name']} #{person['last_name']}"
      candidates = JSON.parse(File.read('candidates.json'))
      result_hash = { person: person_name, result: candidates.sample }
      @elections << result_hash
    end

    update_json('elections.json', @elections)

    see_results
  end

  private

  def see_results
    elections = JSON.parse(File.read('elections.json'))

    results = elections.group_by do |entry|
      "#{entry['result']['first_name']} #{entry['result']['last_name']}"
    end.transform_values(&:count).sort_by { |_, v| -v }

    return_results(elections, results)
  end

  def return_results(elections_data, results_data)
    result_number = elections_data.count
    puts "Elections results:"

    @percentage_results = {}

    results_data.each do |key, value|
      candidate_results = "#{key.to_s} --- #{value.to_f / result_number * 100}%"
      puts candidate_results
      @percentage_results[key] = value.to_f / result_number * 100
    end

    elections_winner = @percentage_results.find { |key, value| value > 50 } # get a candidate with more than 50% of votes

    second_round?(elections_winner)
  end

  def second_round?(winner)
    if winner
      puts "The first round of elections is over"
      puts "Candidate that have got more than 50% \n---> #{winner[0]} with #{winner[1]} votes"
    else
      puts "The first round of elections is over. The second round of elections is announced"
      clean_elections('elections.json') # delete current elections results because of new round of electinos
    end
  end

  def clean_elections(file)
    elections = JSON.parse(File.read(file))
    elections.clear()

    update_json(file, elections)
  end
end
