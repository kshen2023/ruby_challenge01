require 'net/http'
require 'json'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json'
uri = URI(url)
response = Net::HTTP.get(uri)
tree_data = JSON.parse(response)

# Uncomment the following line if you want to see the structure of the data
# pp tree_data

# Define a method to count Ash trees
def count_ash_trees(tree_data)
  ash_count = 0
  tree_data.each do |tree|
    if tree['common_name']&.downcase&.include?('ash')
      ash_count += 1
    elsif tree['scientific_name']&.downcase&.include?('fraxinus')
      ash_count += 1
    elsif tree['cfs_common']&.downcase&.include?('ash')
      ash_count += 1
    end
  end
  ash_count
end

# Count the Ash trees
ash_trees_count = count_ash_trees(tree_data)
puts "Number of Ash trees in the dataset: #{ash_trees_count}"
