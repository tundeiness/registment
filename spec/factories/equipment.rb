FactoryBot.define do
  factory :equipment do
    brand_name { "MyString" }
    serial_no { "MyString" }
    condition { "MyString" }
    date_acquired { "2022-09-21" }
    supplier { "MyString" }
    model_number { "MyString" }
    description { "MyText" }
    user { nil }
  end
end
