require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid factory' do
    expect(build(:product)).to be_valid
  end

  it 'is not valid without a name' do
    product = build(:product, name: nil)
    expect(product).not_to be_valid
  end

  it 'is not valid without a purchase date' do
    product = build(:product, purchase_date: nil)
    expect(product).not_to be_valid
  end

  it 'is not valid without a store section' do
    product = build(:product, store_section: nil)
    expect(product).not_to be_valid
  end

  it 'is not valid without a quantity' do
    product = build(:product, quantity: nil)
    expect(product).not_to be_valid
  end

  it 'is not valid if purchased is not true or false' do
    product = build(:product, purchased: nil)
    expect(product).not_to be_valid
  end
end
