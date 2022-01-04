FactoryBot.define do
  factory :user do
    id                    { Faker::Number.between(from: 1, to: 100) }
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_ruby        { 'ヤマダ' }
    first_name_ruby       { 'タロウ' }
    birth_day             { Faker::Date.between(from: '1930-01-01', to: '  2016-12-31') }
  end
end
