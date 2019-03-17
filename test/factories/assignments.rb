FactoryBot.define do
  factory :assignment do
    store_id { 1 }
    employee_id { 1 }
    start_date { "2019-03-17" }
    end_date { "2019-03-17" }
    pay_level { 1 }
  end
end
