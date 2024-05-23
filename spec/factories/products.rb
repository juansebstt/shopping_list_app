FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    purchase_date { Date.today }
    store_name { "Store #{Faker::Company.name}" }
    association :store_section
    purchased { false }
    quantity { 1 }

    trait :purchased do
      purchased { true }
    end

    trait :with_quantity do |quantity|
      quantity { quantity }
    end
  end
end
