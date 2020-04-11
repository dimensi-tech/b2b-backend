# frozen_string_literal: true

class Booking < ApplicationRecord
  extend Enumerize

  belongs_to :package
  belongs_to :customer
  belongs_to :voucher
  has_many :payment_activities, dependent: :destroy

  enumerize :booking_status, in: { booked: 1, modified: 2, cancelled: 3 }
end
