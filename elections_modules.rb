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
end

# module SaveToJson
#   def save_to_json(obj, attributes)
#     obj_data = JSON.parse(File.read(obj))
#     obj_data << to_hash(attributes)

#     File.open(obj, 'w') do |f|
#       f.puts JSON.pretty_generate(obj_data)
#     end
#   end
# end

# module ToHash
#   def to_hash(attributes)
#     hash = {}
#     attributes.each do |key, value|
#       hash.store(key, value)
#     end
#   end
# end

# module UpdateJson
#   def update_json(file_name, obj, method='w')
#     File.open(file_name, method) do |f|
#       f.puts JSON.pretty_generate(obj)
#     end
#   end
# end
