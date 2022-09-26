FactoryBot.define do
  factory :equipment do
    brand_name { Faker::Company.name }
    serial_no { Faker::Company.duns_number }
    condition { 'MyString' }
    date_acquired { '2022-09-21' }
    supplier { 'MyString' }
    model_number { 'MyString' }
    description { 'MyText' }
    name { Faker::Restaurant.name }
    description { Faker::Lorem.paragraph }
    ingredients { Faker::Lorem.sentence }
    image { Faker::Avatar.image }
  end
end
# equip = FactoryBot.create(:equipment)
# equip.brand_name == 'MyString'