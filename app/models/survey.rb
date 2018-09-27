class Survey < ApplicationRecord
  belongs_to :user, optional: true
  has_many :answers, inverse_of: :survey
  accepts_nested_attributes_for :answers,
                                reject_if: proc { |attributes| attributes[:score].blank? },
                                allow_destroy: true

  validates :email, presence: { message: "Email manquant" }
  validates :email, uniqueness: { message: "Email déjà existant" }
  validates :answers, length: { is: Question.count, message: "Test incomplet" }

  def total_score
    answers.weighted_average
  end

  def survey_result(total_score)
    SurveyResult.find_by("max_value >= ? AND min_value <= ?", total_score, total_score)
  end
end
