class Answer < ApplicationRecord
  belongs_to :survey, inverse_of: :answers
  belongs_to :question

  def self.set_scores_and_coefs
    all.joins(:question)
    .select('score, questions.coefficient as coef')
  end

  def self.weighted_average
    answers = set_scores_and_coefs
    total_weight = answers.map(&:coef).sum
    p total_weight
    sum = 0.0
    return sum if total_weight.zero?
    answers.each { |answer| sum += answer.score * answer.coef }
    (sum * 100 ) / ( total_weight * 3 ) # 3 valeur max
  end
end
