class ProductsController < ApplicationController
  def index
    @products = if params[:query].present? && params[:category_id].present?
                  # Hierarchical Search (Search within a specific category)
                  Product.where("name LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
                         .where(category_id: params[:category_id])
                         .page(params[:page]).per(10)
                elsif params[:query].present?
                  # Simple Search (Search across all products)
                  Product.where("name LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
                         .page(params[:page]).per(10)
                elsif params[:category_id].present?
                  # Filter by Category
                  Product.where(category_id: params[:category_id]).page(params[:page]).per(10)
                else
                  # Default: Show all products with pagination
                  Product.page(params[:page]).per(10)
                end
  end

  def show
    @product = Product.find(params[:id])
  end
end
