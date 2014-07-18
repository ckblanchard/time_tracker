# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    contact_name "L. Riddell"
    company "Habitat For Humanity"
    address "XXX Some St."
    address2 "2nd Floor"
    city "San Francisco"
    state "CA"
    zip_code "94104"
    phone_number "415-555-1234"
    user_id 1
  end
end
