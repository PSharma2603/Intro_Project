class Tag < ApplicationRecord
    belongs_to :product  # One-to-Many with Products
  end
  