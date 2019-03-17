class Survey < ApplicationRecord
  has_secure_token
  belongs_to :user, optional: true
  has_many :answers, inverse_of: :survey, dependent: :destroy
  accepts_nested_attributes_for :answers,
                                reject_if: proc { |attributes| attributes[:score].blank? },
                                allow_destroy: true

  validates :email, presence: { message: "Email manquant" }
  validates :email, uniqueness: { message: "Email déjà existant" }
  validates :answers, length: { is: Question.visibles.count, message: "Test incomplet" }
  after_create :add_backup


  def total_score
    answers.weighted_average
  end

  def to_s
    email
  end

  def survey_result
    SurveyResult.find_by("max_value >= ? AND min_value <= ?", total_score, total_score)
  end

  def add_backup
    json = {
      total_score: total_score,
      survey_result: {
        min_value: survey_result.min_value,
        max_value: survey_result.max_value,
        content: survey_result.content
      },
      questions_categories: []
    }
    QuestionsCategory.all.each do |category|
      json[:questions_categories] << {
        weighted_average: category.weighted_average(self),
        title: category.title,
        content: category.content,
        visible: category.visible
      }
    end
    update(backup: json.to_json)
  end
end

