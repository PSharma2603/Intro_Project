class Order < ApplicationRecord
    has_and_belongs_to_many :products  # Many-to-Many with Products
  end
  