class Booking < ApplicationRecord
  belongs_to :package
  belongs_to :customer
  belongs_to :voucher

  has_many :payment_activities, dependent: :destroy
end
