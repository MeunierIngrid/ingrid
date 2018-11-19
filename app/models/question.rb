class Question < ApplicationRecord
  belongs_to :questions_category
  has_many :answers
  validates :title, presence: true

  def self.visibles
    where(visible: true)
  end
end
