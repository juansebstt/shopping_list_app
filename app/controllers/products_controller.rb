class ProductsController < ApplicationController
  # def index
  #   products = Product.all
  #   @grouped_products = products.group_by { |product| product.purchase_date.to_date }
  # end

  def index
    products = Product.all
    grouped_products_hash = products.group_by { |product| product.purchase_date.to_date }
    @grouped_products = grouped_products_hash.sort.sort.to_h
  end

  def new
    @product = Product.new
  end

  # def create
  #   @product = Product.new(product_params)
  #   if @product.save
  #     @new_group = Product.where(purchase_date: @product.purchase_date).count == 1
  #     respond_to do |format|
  #       format.turbo_stream do
  #         grouped_products_hash = Product.all.group_by { |product| product.purchase_date.to_date }
  #         @grouped_products = grouped_products_hash.sort.sort.to_h
  #       end
  #       format.html { redirect_to products_path, notice: 'Product was successfully created.' }
  #     end
  #   else

  #     messages = @product.errors.full_messages.join(', ')
  #     respond_to do |format|
  #       flash.now[:notice] = "You need to fill in the information within the formulary#{@product_group_component}"
  #       format.turbo_stream {Redirect to index with flash message }
  #       format.html { render :new }
  #     end
  #   end
  # end

  def create
    @product = Product.new(product_params)
    if @product.save
      @new_group = Product.where(purchase_date: @product.purchase_date).count == 1
      respond_to do |format|
        format.turbo_stream do
          grouped_products_hash = Product.all.group_by { |product| product.purchase_date.to_date }
          @grouped_products = grouped_products_hash.sort.sort.to_h
        end
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
      end
    else
      messages = @product.errors.full_messages.join(', ')
      flash.now[:error] = "Failed to create product: #{messages}"
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('flash', partial: 'shared/flash_messages') }
        format.html { render :new }
      end
    end
  end


  def mark_as_purchased
    @product = Product.find(params[:id])
    @product.update(purchased: params[:product][:purchased])

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to products_path }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :purchase_date, :store_name, :store_section_id, :quantity, :purchased)
  end

end
