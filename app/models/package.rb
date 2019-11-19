class Package < ApplicationRecord
  belongs_to :product

  has_many :package_details
  has_many :facilities
  accepts_nested_attributes_for :package_details, allow_destroy: true

  def self.mapping_available_date
    results = []

    pluck(:available_date).uniq.each do |available_dates|
      available_dates.each do |available_date|
        results << available_dates
      end
    end

    results = results.reject { |i| i.empty? }
    results.first.uniq
  end
end
