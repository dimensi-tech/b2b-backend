class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :travel_destination
  belongs_to :travel_partner, required: false

  has_many :packages

  validates :name, :image, presence: true
end
