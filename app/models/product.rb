class Product < ApplicationRecord
  # Define association: Product belongs to StoreSection
  belongs_to :store_section

  # Validation rules for product attributes
  validates :name, presence: true, length: { maximum: 128 }, format: { without: /[%$&@+|]/, message: "only allows certain characters" }
  validates :purchase_date, presence: true
  validates :store_name, length: { maximum: 64 }, allow_blank: true
  validates :store_section_id, presence: true, numericality: { only_integer: true }
  validates :purchased, inclusion: { in: [true, false] }
  validates :quantity, presence: true, numericality: { only_integer: true }

  # Default scope to fetch only unpurchased products
  default_scope { where(purchased: false) }
end
