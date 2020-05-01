class Package < ApplicationRecord
  belongs_to :product
  belongs_to :discount, optional: true

  has_many :facilities
  has_many :package_details
  has_many :saving_packages
  accepts_nested_attributes_for :package_details, allow_destroy: true
  accepts_nested_attributes_for :saving_packages, allow_destroy: true

  validates :name, :price, :down_payment, :duration_trip, :min_adult,
            :max_adult, presence: true

  def assigned_down_payment
    if saving_packages.present?
      update(down_payment: saving_packages.order(amount: :asc).first.amount)
    end
  end
end
