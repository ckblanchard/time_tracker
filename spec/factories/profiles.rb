# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    name "John Doe"
    address "526 Grove St."
    address2 ""
    city "San Francisco"
    state "CA"
    zip_code "94102"
    phone_number "415-555-1234"
    user_id 1
  end
end
