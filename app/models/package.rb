class Package < ApplicationRecord
  extend Enumerize

  belongs_to :product
  belongs_to :discount, optional: true

  has_many :facilities
  has_many :policies
  has_many :package_details
  has_many :saving_packages
  accepts_nested_attributes_for :facilities, allow_destroy: true
  accepts_nested_attributes_for :policies, allow_destroy: true
  accepts_nested_attributes_for :package_details, allow_destroy: true
  accepts_nested_attributes_for :saving_packages, allow_destroy: true

  validates :name, :duration_trip, :min_adult,
            :max_adult, presence: true

  enumerize :down_payment_type, in: %i[flat percentage]

  def assigned_down_payment
    if saving_packages.present?
      min_amount = []

      saving_packages.pluck(:adult_amount).each {|adult_amount| min_amount << adult_amount}
      saving_packages.pluck(:child_amount).each {|child_amount| min_amount << child_amount}

      update(down_payment: min_amount.min)
    end
  end
end
