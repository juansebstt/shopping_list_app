require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:store_section) { create(:store_section) }
  let(:valid_attributes) {
    {
      name: "Sample Product",
      purchase_date: Date.today,
      store_name: "Sample Store",
      store_section_id: store_section.id,
      quantity: 1,
      purchased: false
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      purchase_date: nil,
      store_section_id: nil,
      quantity: nil,
      purchased: nil
    }
  }

  describe "GET #index" do
    it "returns a success response" do
      product = create(:product)
      get :index
      expect(response).to be_successful
      expect(assigns(:grouped_products)).not_to be_empty
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)
      end

      it "redirects to the products list" do
        post :create, params: { product: valid_attributes }
        expect(response).to redirect_to(products_path)
      end

      it "responds to turbo stream when format is turbo_stream" do
        post :create, params: { product: valid_attributes }, format: :turbo_stream
        expect(response.content_type).to start_with('text/vnd.turbo-stream.html')
        expect(assigns(:grouped_products)).not_to be_empty
      end
    end

    context "with invalid params" do
      it "does not create a new Product" do
        expect {
          post :create, params: { product: invalid_attributes }
        }.not_to change(Product, :count)
      end

      it "renders the new template" do
        post :create, params: { product: invalid_attributes }
        expect(response).to render_template("new")
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "responds to turbo stream with errors when format is turbo_stream" do
        post :create, params: { product: invalid_attributes }, format: :turbo_stream
        expect(response.content_type).to start_with('text/vnd.turbo-stream.html')
        expect(assigns(:product)).to be_a_new(Product)
      end
    end
  end

  describe "PATCH #mark_as_purchased" do
    let(:product) { create(:product) }

    it "marks the product as purchased" do
      patch :mark_as_purchased, params: { id: product.id, product: { purchased: true } }
      product.reload
      expect(product.purchased).to be true
    end

    it "redirects to the products list" do
      patch :mark_as_purchased, params: { id: product.id, product: { purchased: true } }
      expect(response).to redirect_to(products_path)
    end

    it "responds to turbo stream when format is turbo_stream" do
      patch :mark_as_purchased, params: { id: product.id, product: { purchased: true } }, format: :turbo_stream
      expect(response.content_type).to start_with('text/vnd.turbo-stream.html')
    end
  end
end
