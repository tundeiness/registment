FactoryBot.define do
  factory :equipment do
    brand_name { 'MyString' }
    serial_no { 'MyString' }
    condition { 'MyString' }
    date_acquired { '2022-09-21' }
    supplier { 'MyString' }
    model_number { 'MyString' }
    description { 'MyText' }
  end
end
# equip = FactoryBot.create(:equipment)
# equip.brand_name == 'MyString'