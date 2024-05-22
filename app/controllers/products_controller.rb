class ProductsController < ApplicationController

  # Index action to fetch all products, group them by purchase date, and assign them to @grouped_products
  def index
    products = Product.all
    grouped_products_hash = products.group_by { |product| product.purchase_date.to_date }
    @grouped_products = grouped_products_hash.sort.sort.to_h
  end

  # New action to instantiate a new Product object
  def new
    @product = Product.new
  end

  # Create action to save a new product, handle success and failure responses
  def create
    @product = Product.new(product_params)
    if @product.save
      # Check if the newly created product is the first one on its purchase date
      @new_group = Product.where(purchase_date: @product.purchase_date).count == 1
      respond_to do |format|
        format.turbo_stream do
          # Fetch all products, group them by purchase date, and assign them to @grouped_products for Turbo Stream response
          grouped_products_hash = Product.all.group_by { |product| product.purchase_date.to_date }
          @grouped_products = grouped_products_hash.sort.sort.to_h
        end
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
      end
    else
      # If product creation fails, set flash error messages and render the new form
      messages = @product.errors.full_messages.join(', ')
      flash.now[:error] = "Failed to create product: #{messages}"
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('flash', partial: 'shared/flash_messages') }
        format.html { render :new }
      end
    end
  end

  # Mark a product as purchased
  def mark_as_purchased
    @product = Product.find(params[:id])
    @product.update(purchased: params[:product][:purchased])

    respond_to do |format|
      format.turbo_stream # Render turbo stream
      format.html { redirect_to products_path } # Redirect to products path
    end
  end

  private

  # Strong parameters for product creation and updating
  def product_params
    params.require(:product).permit(:name, :purchase_date, :store_name, :store_section_id, :quantity, :purchased)
  end

end
