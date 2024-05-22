# spec/factories/store_sections.rb

FactoryBot.define do
  factory :store_section do
    name { Faker::Commerce.department }
  end
end
