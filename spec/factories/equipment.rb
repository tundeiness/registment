FactoryBot.define do
  factory :equipment do
    brand_name { Faker::Company.name }
    serial_no { Faker::Alphanumeric.alphanumeric(number: 15) }
    condition { %w[new intact need_repair damaged].sample }

    trait :new do
      condition { :new }
    end

    trait :need_repair do
      condition { :need_repair }
    end

    trait :damaged do
      condition { :damaged }
    end

    trait :intact do
      condition { :intact }
    end

    loan_status { %w[available due_in overdue repairs].sample }

    trait :due_in do
      loan_status { :due_in }
    end

    trait :overdue do
      loan_status { :overdue }
    end

    trait :repairs do
      loan_status { :repairs }
    end

    date_acquired { Faker::Date.in_date_period }
    supplier { Faker::Name.name }
    model_number { Faker::Company.duns_number }
    description { Faker::Lorem.paragraph }
    created_at { Faker::Date.in_date_period }
    service_date { Faker::Date.in_date_period + 30.days }
  end
end
# equip = FactoryBot.create(:equipment)
# equip.brand_name == 'MyString'
