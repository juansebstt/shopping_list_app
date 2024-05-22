class StoreSection < ApplicationRecord
  # Validation rules for store section name
  validates :name, presence: true, length: { maximum: 64 }, format: { with: /\A[a-zA-Z\s]*\z/, message: "only allows letters and whitespace" }

  # Define association: StoreSection has many products
  has_many :products
end
