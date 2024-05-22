class StoreSection < ApplicationRecord
  validates :name, presence: true, length: { maximum: 64 }, format: { with: /\A[a-zA-Z\s]*\z/, message: "only allows letters and whitespace" }
  has_many :products
end
