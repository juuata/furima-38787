FactoryBot.define do
  factory :purchase_address do
    postal_code    { '343-7222' }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    municipalities { Faker::Address.state }
    address        { Faker::Address.building_number }
    building_name  { Faker::Address.city_suffix }
    phone_number   { Faker::PhoneNumber.subscriber_number(length: 11) }
    token          { 'tok_abcdefghijk00000000000000000' }
    item_id        { Faker::Number }
  end
end
