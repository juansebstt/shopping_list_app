require 'rails_helper'
config.autoload_paths += %W(#{config.root}/app/controllers)

RSpec.describe ProductsController, type: :controller do

  describe "GET #index" do
    it "assigns all grouped products to @grouped_products" do
      # Create some products with different purchase dates
      create(:product, purchase_date: 1.day.ago)
      create(:product, purchase_date: 2.days.ago)
      create(:product, purchase_date: 2.days.ago)

      get :index
      expect(assigns(:grouped_products)).to be_a(Hash)
      expect(assigns(:grouped_products).keys.first).to be_a(Date)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "assigns a new product to @product" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_product_attributes) { FactoryBot.attributes_for(:product) }

      it "increases the product count by 1" do
        expect { post :create, params: { product: valid_product_attributes } }.to change(Product, :count).by(1)
      end

      it "assigns the created product to @product" do
        post :create, params: { product: valid_product_attributes }
        expect(assigns(:product)).to be_a(Product)
      end

      it "redirects to the products index (HTML request)" do
        post :create, params: { product: valid_product_attributes }
        expect(response).to redirect_to(products_path)
      end

      it "sets a success flash message (HTML request)" do
        post :create, params: { product: valid_product_attributes }
        expect(flash[:notice]).to eq("Product was successfully created.")
      end

      it "renders updated product data in Turbo Stream (Turbo Stream request)" do
        post :create, params: { product: valid_product_attributes }, format: :turbo_stream
        expect(response.body).to include(@product.id.to_s) # Example check for product data
      end
    end

    context "with invalid attributes" do
      let(:invalid_product_attributes) { { name: "" } }

      it "does not increase the product count" do
        expect { post :create, params: { product: invalid_product_attributes } }.not_to change(Product, :count)
      end

      it "assigns the unsaved product to @product" do
        post :create, params: { product: invalid_product_attributes }
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "renders the new template (HTML request)" do
        post :create, params: { product: invalid_product_attributes }
        expect(response).to render_template(:new)
      end

      it "sets an error flash message (HTML request)" do
        post :create, params: { product: invalid_product_attributes }
        expect(flash.now[:error]).to be_present
      end

      it "renders error messages in Turbo Stream (Turbo Stream request)" do
        post :create, params: { product: invalid_product_attributes }, format: :turbo_stream
        expect(response.body).to include("can't be blank") # Example check for error message
      end
    end
  end

  describe "PATCH #mark_as_purchased" do
    let!(:product) { create(:product) }

    it "updates the product's purchased status" do
      patch :mark_as_purchased, params: { id: product.id, product: { purchased: true } }
      product.reload
      expect(product.purchased).to eq(true)
    end

    it "redirects to the products index (HTML request)" do
      patch :mark_as_purchased, params: { id: product.id }, format: :html
      expect(response).to redirect_to(products_path)
    end
  end
end


# require 'rails_helper'

# RSpec.describe ProductsController, type: :controller do
#   describe "GET #index" do
#     it "assigns all grouped products to @grouped_products" do
#       create(:product, purchase_date: 1.day.ago)
#       create(:product, purchase_date: 2.days.ago)
#       create(:product, purchase_date: 2.days.ago)

#       get :index
#       expect(assigns(:grouped_products)).to be_present
#     end
#   end
# end
