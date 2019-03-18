FactoryBot.define do
  
  # TODO: fill in factory blueprint for employees
  factory :employee do
    first_name {"Alex"}
    last_name {"Heimann"}
    ssn {"023649320"}
    date_of_birth {25.year.ago.to_date}
    role {"employee"}
    active {1}
  end

  # factory blueprint for stores
  factory :store do
    name {"CMU"}
    street {"5001 Forbes Ave"}
    state {"PA"}
    zip {"1523"}
    active {1}
  end

  # factory blueprint for assignments
  factory :assignment do
    association :store
    association :employee
    start_date {1.year.ago.to_date}
    pay_level {1}
  end
end