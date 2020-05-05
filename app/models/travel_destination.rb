class TravelDestination < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :country

  validates :country_id, :image, presence: true
end
