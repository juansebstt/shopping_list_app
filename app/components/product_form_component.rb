# app/components/product_form_component.rb
class ProductFormComponent < ViewComponent::Base
  def initialize(product:)
    @product = product
  end
end
