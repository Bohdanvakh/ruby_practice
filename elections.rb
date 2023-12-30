require 'pry'
require 'json'

PEOPLE = []
ELECTIONS = {}

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

    candidates = JSON.parse(File.read('candidates.json'))
    @elections[person_name] = candidates.sample
  end
end

def see_results
  results = Hash[ELECTIONS.values.group_by{|i| i}.map {
    |key, value| ["#{key['first_name']} #{key['last_name']}", value.count]
  }.sort_by { |k, v| -v }]

  result_number = ELECTIONS.count

  puts "Elections results:"

  results.each do |key, value|
    puts "#{key.to_s} --- #{value.to_f / result_number * 100}%"
  end
end

Person.create_electorate_list('people.json')
