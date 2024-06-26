# 1

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

        puts "#{carl[:words][2].capitalize} #{sagan[0][:are]} #{sagan[0]['A']} #{sagan[1]['waaaaaay']} #{carl[:words][1]} #{sagan[1][:th3]} #{carl[:toast]} #{sagan[3][2][0]} #{carl[:words][0]} #{sagan[2]}#{carl[:punctuation][1]}"

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

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'


def get_tree_data(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end


def count_ash_trees(tree_data)
  ash_tree_count = 0

  tree_data.each do |tree|
    if tree['common_name']&.downcase&.include?('ash')
      ash_tree_count += 1
    elsif tree['scientific_name']&.downcase&.include?('fraxinus')
      ash_tree_count += 1
    end
  end

  ash_tree_count

end

#Retrieve tree data from the subset URL
tree_data = get_tree_data(url)

#Count Ash trees
ash_count = count_ash_trees(tree_data)
puts "Number of Ash trees in Winnipeg: #{ash_count}"



