class Survey < ApplicationRecord
  belongs_to :user, optional: true
  has_many :answers, inverse_of: :survey
  accepts_nested_attributes_for :answers,
                                reject_if: proc { |attributes| attributes[:score].blank? },
                                allow_destroy: true
end
