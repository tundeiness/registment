FactoryBot.define do
  factory :equipment_condition do
    equipment
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

    num { Faker::Number.non_zero_digit }
  end
end
