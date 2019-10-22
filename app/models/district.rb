class District < ApplicationRecord
  belongs_to :province

  has_many :sub_districts

  validates :code, uniqueness: true
end
