class Product < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :vendors
  has_and_belongs_to_many :orders
  has_many :product_tags
  has_many :tags, through: :product_tags

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :image_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "must be a valid URL" }
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, allow_nil: true
end
