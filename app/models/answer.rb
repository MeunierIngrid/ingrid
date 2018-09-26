class Answer < ApplicationRecord
  belongs_to :survey, inverse_of: :answers
  belongs_to :question

  def self.weighted_average
    all.inject do |sum, answer|
      sum + answer.score * answer.question.

    end
  end
end
