class Product < ApplicationRecord
  has_many :packages
  belongs_to :category
  belongs_to :travel_destination
  mount_uploader :image, ImageUploader
  validates :name, :image, presence: true
end