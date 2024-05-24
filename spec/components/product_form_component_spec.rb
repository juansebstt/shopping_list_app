require 'rails_helper'
require 'view_component/test_helpers'

RSpec.describe ProductFormComponent, type: :component do
  include ViewComponent::TestHelpers

  let(:product) { build(:product) }

  it "renders the product form with the correct fields" do
    render_inline(ProductFormComponent.new(product: product))

    expect(page).to have_selector("form")
    expect(page).to have_field("Name", with: product.name)
    expect(page).to have_field("Store name", with: product.store_name)
    expect(page).to have_field("Quantity", with: product.quantity)
  end

  it "renders the product form with a submit button" do
    render_inline(ProductFormComponent.new(product: product))

    expect(page).to have_button("Create Product")
  end
end
