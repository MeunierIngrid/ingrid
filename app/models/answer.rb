class Answer < ApplicationRecord
  belongs_to :survey, inverse_of: :answers
  belongs_to :question
end
