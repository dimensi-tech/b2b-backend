class Product < ApplicationRecord
  has_many :packages
  belongs_to :category
  mount_uploader :image, ImageUploader
  validates :name, :image, presence: true
end