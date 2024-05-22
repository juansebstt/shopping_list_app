FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name.gsub(/[%$&@+|]/, '') } # Remover caracteres no permitidos
    purchase_date { Faker::Date.backward(days: 14) }
    store_name { Faker::Company.name }
    purchased { false }
    quantity { Faker::Number.between(from: 1, to: 20) }
    store_section_id { FactoryBot.create(:store_section).id } # Asigna un ID de sección de tienda válido
  end
end
