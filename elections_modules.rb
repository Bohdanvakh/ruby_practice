module SaveToJson
  def save_to_json(obj, attributes)
    obj_data = JSON.parse(File.read(obj))
    obj_data << to_hash(attributes)

    File.open(obj, 'w') do |f|
      f.puts JSON.pretty_generate(obj_data)
    end
  end
end

module ToHash
  def to_hash(attributes)
    hash = {}
    attributes.each do |key, value|
      hash.store(key, value)
    end
  end
end
