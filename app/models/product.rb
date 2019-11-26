class Product < ApplicationRecord
  has_many :packages
  mount_uploader :image, ImageUploader
  validates :name, presence: true
end