# Using a single puts statement build the following
# sentence using only data from the carl hash and the
# sagan array along with some string interpolation.
#
# We are a way for the cosmos to know itself.

carl  = {
          :toast => 'cosmos',
          :punctuation => [ ',', '.', '?' ],
          :words => [ 'know', 'for', 'we']
        }

sagan = [
          { :are => 'are', 'A' => 'a' },
          { 'waaaaaay' => 'way', :th3 => 'the' },
          'itself',
          { 2 => ['to']}
        ]

        puts "#{carl[:words][2]} #{sagan[0][:are]} #{sagan[0]['A']} #{sagan[1]['waaaaaay']} #{carl[:words][1]} #{sagan[1][:th3]} #{carl[:toast]} #{sagan[3][2][0]} #{carl[:words][0]} #{sagan[2]}"

# 2

ghosts = [
    { name: 'Inky', age: 4, loves: 'reindeers', net_worth: 25 },
    { name: 'Pinky', age: 5, loves: 'garden tools', net_worth: 14 },
    { name: 'Blinky', age: 7, loves: 'ninjas', net_worth: 18.03 },
    { name: 'Clyde', age: 6, loves: 'yarn', net_worth: 0 }
  ]
  
  ghosts.each do |ghost|
    ghost_info  = "#{ghost[:name]} is #{ghost[:age]} years old, "
    ghost_info += "loves #{ghost[:loves]} and "
    ghost_info += "has #{ghost[:net_worth]} dollars in the bank."
    puts ghost_info
  end

  #3

  require 'net/http'
require 'json'

url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response)

dog_breeds['message'].each do |breed, sub_breeds|
  puts "* #{breed.capitalize}"
  sub_breeds.each do |sub_breed|
    puts "  * #{sub_breed.capitalize}" unless sub_breed.empty?
  end
end

#4

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



