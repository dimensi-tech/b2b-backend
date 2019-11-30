class Product < ApplicationRecord
  has_many :packages
  mount_uploader :image, ImageUploader
  validates :name, :image, presence: true
end