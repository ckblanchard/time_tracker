# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    entry_date Date.today
    start_time Time.now
    end_time Time.now + 1.hour
    total_time nil
    status 0
    user_id 1
    invoice_id 1
  end

  factory :unfinished_entry, class: Entry do
    entry_date Date.today
    start_time Time.now
    end_time nil
    total_time nil
    status 0
    user_id 1
    invoice_id 1
    topic_id 1
  end
end
