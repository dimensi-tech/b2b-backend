# frozen_string_literal: true

class Booking < ApplicationRecord
  extend Enumerize

  belongs_to :package
  belongs_to :customer
  # belongs_to :voucher

  has_many :payment_activities, dependent: :destroy
  has_many :payment_savings, dependent: :destroy

  enumerize :booking_status, in: { pending: 0, booked: 1, modified: 2, cancelled: 3,
                                   down_payment: 4, saving_progress: 5, completed: 6,
                                   paid: 7, payment_50: 8, payment_final: 9}

  def calculate_total_booking
    total_adult_price = adult.to_i * package.adult_price.to_i
    total_child_price = child.to_i * package.child_price.to_i
    total_adult_price + total_child_price
  end
end
