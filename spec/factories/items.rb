FactoryBot.define do
  factory :item do
    items_name            { Faker::Name.initials(number: 10) }
    description           { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 2, to: 11) }
    status_id             { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id    { Faker::Number.between(from: 2, to: 3) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    days_for_shipping_id  { Faker::Number.between(from: 2, to: 4) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
