class Question < ApplicationRecord
  belongs_to :questions_category
  has_many :answers, dependent: :destroy
  validates :title, presence: true
  scope :visibles, -> { where(visible: true) }

end
