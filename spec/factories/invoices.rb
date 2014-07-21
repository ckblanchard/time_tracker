# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    invoice_date "2014-07-20 18:15:32"
    status 1
    association :job
  end

  factory :invalid_invoice, class: Invoice do
    invoice_date nil
    status nil
    association :job
  end
end
