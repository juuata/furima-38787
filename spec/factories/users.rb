FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Alphanumeric.alphanumeric }
    password_confirmation { password }
    family_name           { '谷口' }
    first_name            { '智紀' }
    family_name_kana      { 'タニグチ' }
    first_name_kana       { 'トモキ' }
    birthday              { Faker::Date.birthday }
  end
end
