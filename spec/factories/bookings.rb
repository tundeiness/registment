FactoryBot.define do
  factory :booking do
    user
    equipment
    status { %w[available reserved returned checked_out].sample }

    trait :reserved do
      status { :reserved }
    end

    trait :checked_out do
      status { :checked_out }
    end

    trait :returned do
      status { :returned }
    end

    booking_date { Faker::Date.in_date_period }
    description { Faker::Lorem.paragraph(sentence_count: 5) }
    pickup_date { Faker::Date.in_date_period }
    return_date { pickup_date + 14.days }
    booking_price { Faker::Commerce.price(range: 15_000.0..500_000.0, as_string: true) }
  end
end
