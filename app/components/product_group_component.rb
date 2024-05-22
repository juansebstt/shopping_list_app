class ProductGroupComponent < ViewComponent::Base
  include Turbo::FramesHelper
  
  def initialize(date:, products:)
    @date = date
    @card_products = products
  end

  def to_partial_path
    "product_group_components/product_group_component"
  end
end
