class TravelDestination < ApplicationRecord
    validates :country_id, presence: true
end
