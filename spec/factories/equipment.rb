FactoryBot.define do
  factory :equipment do
    brand_name { Faker::Company.name }
    serial_no { Faker::Alphanumeric.alphanumeric(number: 15) }
    # condition { 'MyString' }
    trait :broken do
      condition :broken
    end

    trait :intact do
      condition :intact
    end

    date_acquired { Faker::Date.in_date_period }
    supplier { Faker::Name.name }
    model_number { Faker::Company.duns_number }
    description { Faker::Lorem.paragraph }
  end
end
# equip = FactoryBot.create(:equipment)
# equip.brand_name == 'MyString'