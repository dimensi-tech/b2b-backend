class Booking < ApplicationRecord
  belongs_to :package
  belongs_to :customer
  belongs_to :voucher
  extend Enumerize
  has_many :payment_activities, dependent: :destroy

  enumerize :status, in: { ordered: 0, paid: 1, error: 2 }
end
