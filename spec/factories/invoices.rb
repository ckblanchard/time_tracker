# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    invoice_date Date.today
    status 0
    association :job
  end

  factory :invalid_invoice, class: Invoice do
    invoice_date nil
    status nil
    association :job
  end
end
