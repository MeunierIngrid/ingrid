class Contact < ApplicationRecord
  enum rdv: { bilan: 0, suivi: 1, other: 2 }

  def full_name
    "#{first_name.capitalize} #{last_name.upcase}"
  end
end
