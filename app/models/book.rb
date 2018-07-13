class Book < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  has_one_attached :cover
  monetize :price_cents
  has_many :orders

end
