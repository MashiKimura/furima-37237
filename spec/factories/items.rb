FactoryBot.define do
  factory :item do
    name              { Faker::Name.name }
    explanation       { Faker::Commerce.product_name }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    situation_id      { Faker::Number.between(from: 2, to: 7) }
    delivery_id       { Faker::Number.between(from: 2, to: 3) }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id   { Faker::Number.between(from: 2, to: 4) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
