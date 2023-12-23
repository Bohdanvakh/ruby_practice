require 'pry'
require 'json'

CANDIDATES = []
PEOPLE = []
ELECTIONS = {}

class Candidate
  attr_accessor :first_name, :last_name, :political_party

  @@candidates = CANDIDATES

  def initialize(first_name, last_name, political_party)
    @first_name = first_name
    @last_name = last_name
    @political_party = political_party

    @@candidates << self
  end

  protected

  def self.create_candidates_list(file_path)
    json_data = File.read(file_path)
    data = JSON.parse(json_data)

    data.each do |first_name, last_name, political_party|
      Candidate.new(first_name, last_name, political_party)
    end
  end
end

class Person
  @@people = PEOPLE

  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name

    @@people << self
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
  @elections = ELECTIONS

  PEOPLE.each do |person|
    person_name = "#{person.first_name} #{person.last_name}"
    @elections[person_name] = CANDIDATES.sample
  end
end

def see_results
  results = Hash[ELECTIONS.values.group_by{|i| i}.map {
    |key, value| ["#{key.first_name} #{key.last_name}", value.count]
  }.sort_by { |k, v| -v }]

  result_number = ELECTIONS.count

  puts "Elections results:"

  results.each do |key, value|
    puts "#{key.to_s} --- #{value.to_f / result_number * 100}%"
  end
end

Candidate.create_candidates_list('candidates.json')
Person.create_electorate_list('people.json')
