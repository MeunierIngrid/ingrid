class Contact < ApplicationRecord
  enum rdv: { bilan: 0, suivi: 1, other: 2 }
end
