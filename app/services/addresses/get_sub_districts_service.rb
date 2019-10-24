require 'net/http'
require 'uri'

module Addresses
  class GetSubDistrictsService
    def initialize
      @districts = District.all
      @result    = { saved_rows: [], failed_rows: [] }
    end

    def call
      if @districts.present?
        @districts.each do |district|
          response = send_request(district.code)

          if response.is_a?(Net::HTTPOK)
            JSON.parse(response.body)['kecamatans'].each do |sub_district|
              create_sub_district(sub_district, district)
            end
          end
        end
      end
    end

    private

    def create_sub_district(sub_district, district)
      SubDistrict.find_or_create_by(
        code: sub_district['id'],
        name: sub_district['nama'],
        district_id: district.id
      )
    end

    def send_request(district_code)
      uri      = URI.parse("#{ENV['PROVINCES_URL']}/kabupaten/#{district_code}/kecamatan")
      http     = Net::HTTP.new(uri.host, uri.port)
      response = http.get(uri)
    end
  end
end
