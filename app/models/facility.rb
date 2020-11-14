class Facility < ApplicationRecord
  belongs_to :package

  # validates :package_id, :name, presence: true
end
