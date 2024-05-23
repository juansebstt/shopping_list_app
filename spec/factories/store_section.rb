FactoryBot.define do
  factory :store_section do
    name { Faker::Lorem.unique.word.capitalize }
  end
end
