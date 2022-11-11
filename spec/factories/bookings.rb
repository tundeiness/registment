FactoryBot.define do
  factory :booking do
    user { nil }
    equipment { nil }
    status { "MyString" }
    booking_date { "2022-11-11" }
    description { "MyText" }
    pickup_date { "2022-11-11" }
    return_date { "2022-11-11" }
    booking_price { "9.99" }
  end
end
