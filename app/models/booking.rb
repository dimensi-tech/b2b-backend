# frozen_string_literal: true

class Booking < ApplicationRecord
  extend Enumerize

  belongs_to :package
  belongs_to :customer
  belongs_to :voucher

  has_many :payment_activities, dependent: :destroy
  has_many :payment_savings, dependent: :destroy

  enumerize :booking_status, in: { booked: 1, modified: 2, cancelled: 3 }

  def calculate_total_booking
    total_adult_price = adult * package.adult_price
    total_child_price = child * package.child_price
    total_adult_price + total_child_price
  end
end
