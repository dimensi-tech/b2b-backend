class Identity < ApplicationRecord
  validates :nik, presence: true
  validates :full_name, presence: true
end
