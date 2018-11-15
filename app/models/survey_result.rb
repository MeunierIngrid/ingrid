class SurveyResult < ApplicationRecord
  validates :min_value, presence: true
  validates :max_value, presence: true
end
