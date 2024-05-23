require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Product model" do
    context 'when valid attributes are provided' do
      it "is valid with valid attributes" do
        store_section = create(:store_section)
        product = build(:product, store_section_id: store_section.id)
        expect(product).to be_valid
      end
    end

    context 'when attributes are missing or invalid' do
      it "is not valid without a name" do
        product = build(:product, name: nil)
        expect(product).not_to be_valid
      end

      it "is not valid without a purchase date" do
        product = build(:product, purchase_date: nil)
        expect(product).not_to be_valid
      end

      # Add more validations as needed
    end

    context 'when association is not valid' do
      it "is not valid without a store section association" do
        product = build(:product, store_section: nil)
        expect(product).not_to be_valid
      end

      # Add more association validations as needed
    end
  end
end
