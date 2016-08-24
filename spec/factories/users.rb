# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "John"
    sequence(:email) { |n| "testuser#{n}@example.com" }
  end
end
