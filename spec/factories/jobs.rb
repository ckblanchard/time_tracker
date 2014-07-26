# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    job_name { Faker::Hacker.adjective }
    start_date "2014-07-19 22:19:57"
    end_date "2014-08-19 22:19:57"
    rate_cents 1000
    association :client
  end

  factory :invalid_job, class: Job do
    job_name nil
    start_date nil
    end_date nil
    rate nil
    association :client
  end
end
