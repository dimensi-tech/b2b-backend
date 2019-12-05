class Booking < ApplicationRecord
  belongs_to :package
  belongs_to :customer
  belongs_to :voucher
end
