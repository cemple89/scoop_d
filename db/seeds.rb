# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# frozen_string_literal: true
require 'json'

# https://www.yelp.com/developers/api_console

# Dir.foreach("./db/JSONdata") do |file|
#   next if file == "." or file == ".."
#
#   location_data = File.read("./db/JSONdata/" + file)
#   sorted_location_data = JSON.parse(location_data)
#
#   sorted_location_data.each do |key, value|
#     if key == 'businesses'
#       value.each do |b_key|
#         if Location.find_by(phone_number: b_key["display_phone"]) != nil
#           next
#         else
#           Location.create(
#             name: b_key['name'],
#             address: b_key["location"]['address'],
#             city: b_key["location"]['city'],
#             state: b_key["location"]['state_code'],
#             zip_code: b_key["location"]['postal_code'],
#             neighborhood: b_key["location"]['neighborhoods'],
#             phone_number: b_key["display_phone"],
#             image_url: b_key["image_url"],
#             user_id: -1
#           )
#         end
#       end
#     end
#   end
# end





































# bos_location_data = File.read('bos_locations.json')
# bos_location_data_sorted = JSON.parse(bos_location_data)
# camb_location_data = File.read('camb_locations.json')
# camb_location_data_sorted = JSON.parse(camb_location_data)
#
# bos_location_data_sorted.each do |key, value|
#   if key == 'businesses'
#     value.each do |b_key|
#       puts b_key['name']
#       puts b_key['phone']
#       puts b_key['snippet_text']
#       puts '//////\n\n'
#     end
#   end
# end
#
# puts '//////////////////////'
#
# camb_location_data_sorted.each do |key, value|
#   if key == 'businesses'
#     value.each do |b_key|
#       puts b_key['name']
#       puts b_key['phone']
#       puts b_key['snippet_text']
#       puts '//////\n\n'
#     end
#   end
# end
