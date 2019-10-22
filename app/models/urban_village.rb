class UrbanVillage < ApplicationRecord
  belongs_to :sub_district

  validates :code, uniqueness: true
end
