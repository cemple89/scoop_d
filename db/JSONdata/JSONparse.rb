# frozen_string_literal: true
require 'json'

# https://www.yelp.com/developers/api_console

bos_location_data = File.read('bos_locations.json')
bos_location_data_sorted = JSON.parse(bos_location_data)
camb_location_data = File.read('camb_locations.json')
camb_location_data_sorted = JSON.parse(camb_location_data)

bos_location_data_sorted.each do |key, value|
  if key == 'businesses'
    value.each do |b_key|
      puts b_key['name']
      puts b_key['phone']
      puts b_key['snippet_text']
      puts '//////\n\n'
    end
  end
end

puts '//////////////////////'

camb_location_data_sorted.each do |key, value|
  if key == 'businesses'
    value.each do |b_key|
      puts b_key['name']
      puts b_key['phone']
      puts b_key['snippet_text']
      puts '//////\n\n'
    end
  end
end
