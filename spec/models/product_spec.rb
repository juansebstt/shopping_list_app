# spec/models/product_spec.rb
require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is invalid without a name' do
    product = Product.new(name: nil)
    expect(product).to_not be_valid
    expect(product.errors[:name]).to include("can't be blank")
  end
end
