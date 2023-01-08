FactoryBot.define do
  factory :purchase_address do
    postal_code    { Faker::Address.postcode }
    prefecture_id  { Faker::Number.between(from: 2, to: 48)}
    municipalities { Faker::Address.state }
    address        { Faker::Address.building_number }
    building_name  { Faker::Address.city_suffix }
    phone_number   { Faker::PhoneNumber.phone_number } 
  end
end
