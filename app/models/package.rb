class Package < ApplicationRecord
  belongs_to :product
  belongs_to :discount, optional: true

  has_many :package_details
  has_many :facilities
  accepts_nested_attributes_for :package_details, allow_destroy: true
  
  validates :name, :price, :down_payment, :duration_trip, :min_person, presence: true
end
