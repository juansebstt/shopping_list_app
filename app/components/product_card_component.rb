# app/components/product_card_component.rb
class ProductCardComponent < ViewComponent::Base
  def initialize(product:)
    @product = product
  end
end
