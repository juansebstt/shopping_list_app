require 'rails_helper'
require 'view_component/test_helpers'

RSpec.describe ProductCardComponent, type: :component do
  include ViewComponent::TestHelpers

  let(:product) { create(:product, name: "Test Product", store_name: "Test Store", quantity: 5) }

  it "renders the product card with the correct content" do
    render_inline(ProductCardComponent.new(product: product))

    expect(rendered_component.to_s).to include("Test Product")
    expect(rendered_component.to_s).to include("Test Store")
    expect(rendered_component.to_s).to include("5")
  end

  it "renders the product card with the purchase date" do
    render_inline(ProductCardComponent.new(product: product))

    expect(rendered_component.to_s).to include(product.purchase_date.strftime("%Y-%m-%d"))
  end

end
