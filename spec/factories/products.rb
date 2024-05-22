FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    purchase_date { Faker::Date.backward(days: 30) }
    store_name { Faker::Company.name }
    store_section
    purchased { false }
    quantity { Faker::Number.between(from: 1, to: 100) }

    association :store_section
  end
end
