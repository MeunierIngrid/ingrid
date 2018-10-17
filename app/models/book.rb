class Book < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  has_one_attached :cover
  has_one_attached :pdf
  monetize :price_cents
  has_many :orders

  def visible?
    visible
  end
end
