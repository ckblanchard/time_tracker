# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :client do
    contact_name { Faker::Name.name }
    company { Faker::Company.name }
    address { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    # zip_code { Faker::Address.zip_code }
    zip_code "12345"
    phone_number "415-555-1234" #{ Faker::PhoneNumber.phone_number }
    user_id 1
  end

  factory :lindsay, class: Client do
    contact_name "L. Riddell"
    company "Habitat"
    address "XXX Some St."
    address2 "2nd Floor"
    city "San Francisco"
    state "CA"
    zip_code "94104"
    phone_number "415-555-1234"
    user_id 2
  end
end
