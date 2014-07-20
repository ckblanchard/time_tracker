# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code "12345"
    phone_number "415-555-1234" #{ Faker::PhoneNumber.phone_number }
    association :user
  end

  # factory :profile do
  #   name "John Doe"
  #   address "526 Grove St."
  #   address2 ""
  #   city "San Francisco"
  #   state "CA"
  #   zip_code "94102"
  #   phone_number "415-555-1234"
  #   user_id 1
  # end
end
