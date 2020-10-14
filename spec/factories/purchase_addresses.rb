FactoryBot.define do
  factory :purchase_address do
    postal_code {"123-4567"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    building {Faker::Address.building_number}
    phone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
