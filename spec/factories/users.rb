FactoryBot.define do
  factory :user do

    nickname  { Faker::Name.name }
    email     { Faker::Internet.unique.email }
    password  { 'aa2' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    family_name       { 'ほげ' }
    first_name        { 'ほげ' }
    family_name_kana  { 'ホゲ' }
    first_name_kana   { 'ホゲ' }
    birth_day         { Faker::Date.birthday }
  end
end