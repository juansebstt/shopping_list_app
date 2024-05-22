let(:store_section) { create(:store_section) }
before do
  create(:product, purchase_date: 2.days.ago, store_section_id: store_section.id)
end
