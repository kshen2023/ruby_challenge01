require 'net/http'
require 'json'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
uri = URI(url)

response = Net::HTTP.get(uri)
trees = JSON.parse(response)

# count all the Ash trees in the dataset
ash_tree_count = trees.count { |tree| tree['common_name'] && tree['common_name'].downcase.include?('ash') }

puts "Ash trees count: #{ash_tree_count}"
