class Province < ApplicationRecord
  has_many :districts

  validates :code, uniqueness: true
end
