class Survey < ApplicationRecord
  belongs_to :user, optional: true
  has_many :answers, inverse_of: :survey
  accepts_nested_attributes_for :answers,
                                reject_if: proc { |attributes| attributes[:score].blank? },
                                allow_destroy: true

  validates :email, presence: true
  validates :email, uniqueness: true

  def total_score
    answers.weighted_average
  end

  def survey_result(total_score)
    SurveyResult.find_by("max_value >= ? AND min_value <= ?", total_score, total_score)
  end
end
