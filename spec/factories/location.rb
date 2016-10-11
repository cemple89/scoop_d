require 'factory_girl_rails'

FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "Sweet Ice Cream Spot ##{n}"}
    sequence(:address) { |n| "#{n} Fake Street"}
    city "Boston"
    state "MA"
    zip_code "02135"
  end
end
