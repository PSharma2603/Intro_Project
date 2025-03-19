class ProductsController < ApplicationController
  def index
    @products = Product.all  # Fetch all products
  end

  def show
    @product = Product.find(params[:id])  # Fetch a single product by ID
  end
end
