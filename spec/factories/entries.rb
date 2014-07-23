# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    entry_date "2014-07-23"
    start_time "2014-07-23 13:00:21"
    end_time "2014-07-23 13:00:21"
    total_time "2014-07-23 13:00:21"
    status 0
    # association :user
    # association :invoice
  end
end
