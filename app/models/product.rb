class Product < ApplicationRecord
  has_many :packages
  mount_uploader :image, ImageUploader
end
