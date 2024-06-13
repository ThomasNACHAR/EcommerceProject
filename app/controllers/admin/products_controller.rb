class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      @products = Product.all
      render :index
    else
      add_notification(@product.errors.full_messages, "error")
    end
  end

  private

  def product_params
    params.require(:product).permit(:label, :sku, :category_id, :quantity, :price, :description)
  end
end