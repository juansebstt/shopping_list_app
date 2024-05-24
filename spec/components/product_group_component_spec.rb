require 'rails_helper'
require 'view_component/test_helpers'

RSpec.describe ProductGroupComponent, type: :component do
  include ViewComponent::TestHelpers

  let(:product) { build_stubbed(:product, name: "Test Product", purchase_date: Date.today) }
  let(:date) { Date.today }
  let(:products) { [product] }

  it "renders the product group with the correct date" do
    render_inline(ProductGroupComponent.new(date: date, products: products))

    expect(page).to have_text(date.strftime('%A, %B %d, %Y'))
  end

  it "renders the product group with the correct products" do
    render_inline(ProductGroupComponent.new(date: date, products: products))

    products.each do |product|
      expect(page).to have_text(product.name)
    end
  end
end
