# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    name { Faker::Hacker.adjective }
  end
end
