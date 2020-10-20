FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    association :item
    association :user
  end
end
