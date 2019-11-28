class Booking < ApplicationRecord
  belongs_to :package
  belongs_to :customer
end
