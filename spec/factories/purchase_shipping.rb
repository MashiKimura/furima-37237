FactoryBot.define do
  factory :purchase_shipping do
    postcode          { '000-0000' }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    city              { '台東区' }
    street_address    { '1-1' }
    building          { '東京ハイツ' }
    tel               { '09011112222' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
