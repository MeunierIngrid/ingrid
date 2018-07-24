class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
  monetize :amount_cents
end
