require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_email#{n}@gmail.com"}
    password "tester_password"
  end
end

FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "Sweet Ice Cream Spot ##{n}"}
    sequence(:address) { |n| "#{n} Fake Street"}
    city "Boston"
    state "MA"
    zip_code "02135"
  end
end

FactoryGirl.define do
  factory :review do
    sequence(:flavor) { |n| "Sweet Ice Cream Spot ##{n}"}
    rating {rand(1..5)}
  end
end
