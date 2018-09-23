class Question < ApplicationRecord
  belongs_to :questions_category
  has_many :anwsers
end
