FactoryBot.define do
  factory :equipment do
    brand_name { Faker::Company.name }
    serial_no { Faker::Alphanumeric.alphanumeric(number: 15) }
    # condition { 'MyString' }
    trait :broken do
      condition { 'broken' }
    end

    trait :intact do
      condition { 'intact' }
    end
    date_acquired { Faker::Date.in_date_period }
    supplier { Faker::Name.name }
    model_number { Faker::Company.duns_number }
    description { Faker::Lorem.paragraph }
    # brand_name { 'MyString' }
    # serial_no { 'MyString' }
    # date_acquired { '2022-09-21' }
    # supplier { 'MyString' }
    # model_number { 'MyString' }
    # description { 'MyText' }
    # email { "#{brand_name}.#{serial_no}@example.com".downcase }
  end
end
# equip = FactoryBot.create(:equipment)
# equip.brand_name == 'MyString'