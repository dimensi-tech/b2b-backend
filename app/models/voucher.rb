class Voucher < ApplicationRecord
  has_many :voucher_usages
  has_many :bookings
end
