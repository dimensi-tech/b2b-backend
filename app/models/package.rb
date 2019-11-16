class Package < ApplicationRecord
  belongs_to :product

  has_many :package_details
  has_many :facilities
  accepts_nested_attributes_for :package_details, allow_destroy: true
end
