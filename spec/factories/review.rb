require 'factory_girl_rails'

FactoryGirl.define do
  factory :review do
    sequence(:flavor) { |n| "Sweet Ice Cream Spot ##{n}"}
    rating {rand(1..5)}
  end
end
