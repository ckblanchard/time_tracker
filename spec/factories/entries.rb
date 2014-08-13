# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    entry_date "2014-07-23"
    start_time "2014-07-23 13:00:21"
    end_time "2014-07-23 15:28:42"
    total_time nil
    status 0
    user_id 1
    invoice_id 1
    topic_id 1
  end
end
