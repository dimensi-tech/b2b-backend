class PackageDetail < ApplicationRecord
  belongs_to :package
  # belongs_to :product, through: :package
  mount_uploader :image, ImageUploader
end
