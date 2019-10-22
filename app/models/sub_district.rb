class SubDistrict < ApplicationRecord
  belongs_to :district

  has_many :urban_villages

  validates :code, uniqueness: true
end
