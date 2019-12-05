class TravelDestination < ApplicationRecord
  validates :country_id, :image, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :country
end
