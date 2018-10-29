class Book < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  has_one_attached :cover
  has_one_attached :pdf
  monetize :price_cents
  has_many :orders
  validates :title, presence: true
  validates :title, uniqueness: true
  before_create :add_slug

  def visible?
    visible
  end

  def add_slug
    self.slug = title.parameterize
  end
end
