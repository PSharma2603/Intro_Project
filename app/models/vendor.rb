class Vendor < ApplicationRecord
  has_and_belongs_to_many :products

  validates :name, presence: true, uniqueness: true
  validates :contact_info, presence: true
end
