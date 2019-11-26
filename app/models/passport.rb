class Passport < ApplicationRecord
  validates :full_name, presence: true
  validates :number, presence: true
end
