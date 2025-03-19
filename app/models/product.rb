class Product < ApplicationRecord
  belongs_to :category
  has_many :orders, through: :order_products
  has_many :tags
  has_and_belongs_to_many :vendors  # Many-to-Many with Vendors
  has_and_belongs_to_many :orders  # Many-to-Many with Orders
end
