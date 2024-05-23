require 'rails_helper'

RSpec.describe StoreSection, type: :model do
  describe "StoreSection model" do
    context 'when valid attributes are provided' do
      it "is valid with valid attributes" do
        store_section = build(:store_section)
        expect(store_section).to be_valid
      end
    end

    context 'when attributes are missing or invalid' do
      it "is not valid without a name" do
        store_section = build(:store_section, name: nil)
        expect(store_section).not_to be_valid
      end

      it "is not valid with a name longer than 64 characters" do
        store_section = build(:store_section, name: 'a' * 65)
        expect(store_section).not_to be_valid
      end

      it "is not valid with a name containing non-letter characters" do
        store_section = build(:store_section, name: 'Section 1')
        expect(store_section).not_to be_valid
      end
    end

    context 'associations' do
      it "has many products" do
        store_section = create(:store_section)
        product1 = create(:product, store_section: store_section)
        product2 = create(:product, store_section: store_section)
        expect(store_section.products).to include(product1, product2)
      end
    end
  end
end
