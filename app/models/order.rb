class Order < ApplicationRecord
  has_and_belongs_to_many :products

  validates :user_name, presence: true
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
end
