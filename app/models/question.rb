class Question < ApplicationRecord
  belongs_to :questions_category
  has_many :answers
  validates :title, presence: true
end
