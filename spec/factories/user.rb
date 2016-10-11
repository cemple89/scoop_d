require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_email#{n}@gmail.com"}
    password "tester_password"
  end
end
