# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    job_name { Faker::Hacker.adjective }
    start_date Date.today
    end_date Date.tomorrow
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
