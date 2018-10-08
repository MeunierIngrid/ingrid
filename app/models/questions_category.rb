class QuestionsCategory < ApplicationRecord
  has_many :questions

  def self.visibles
    where(visible: true)
  end
end
