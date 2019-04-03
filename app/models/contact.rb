class Contact < ApplicationRecord
  validates :email, presence: { message: "Email manquant" }
  validates_format_of :email, with: Devise::email_regexp

  enum rdv: { bilan: 0, suivi: 1, other: 2 }

  def full_name
    "#{first_name.capitalize} #{last_name.upcase}"
  end
end
