FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    password { Faker::Internet.password }
    password_confirmation { password }
    role { 'normal' }

    trait :admin do
      role { :admin }
    end

    trait :super_admin do
      role { :super_admin }
    end
  end
end
