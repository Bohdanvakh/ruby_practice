module ElectionsModule
  def save_to_json(obj, attributes)
    obj_data = JSON.parse(File.read(obj))
    obj_data << to_hash(attributes)

    File.open(obj, 'w') do |f|
      f.puts JSON.pretty_generate(obj_data)
    end
  end

  def to_hash(attributes)
    hash = {}
    attributes.each do |key, value|
      hash.store(key, value)
    end
  end

  def update_json(file_name, obj, method='w')
    File.open(file_name, method) do |f|
      f.puts JSON.pretty_generate(obj)
    end
  end

  def clean_json_file(file)
    json = JSON.parse(File.read(file))
    json.clear()

    update_json(file, json)
  end

  def elections(candidates_file, people_file, elections_file)
    people = JSON.parse(File.read(people_file))
    @elections = JSON.parse(File.read(elections_file))

    people.each do |person|
      person_name = "#{person['first_name']} #{person['last_name']}"
      candidates = JSON.parse(File.read(candidates_file))
      result_hash = { person: person_name, result: candidates.sample }
      @elections << result_hash
    end

    update_json('elections.json', @elections)
    see_results
  end
end
