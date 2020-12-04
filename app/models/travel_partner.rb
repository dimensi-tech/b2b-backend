class TravelPartner < ApplicationRecord
  mount_uploader :logo, ImageUploader

  has_many :user_managements
  has_many :users
end
