require 'net/http'
require 'uri'

module Addresses
  class GetUrbanVillagesService
    def initialize
      @sub_districts = SubDistrict.all
      @result        = { saved_rows: [], failed_rows: [] }
    end

    def call
      if @sub_districts.present?
        @sub_districts.each do |sub_district|
          response = send_request(sub_district.code)

          if response.is_a?(Net::HTTPOK)
            JSON.parse(response.body)['desas'].each do |urban_village|
              create_urban_village(urban_village, sub_district)
            end
          end
        end
      end
    end

    private

    def create_urban_village(urban_village, sub_district)
      UrbanVillage.find_or_create_by(
        code: urban_village['id'],
        name: urban_village['nama'],
        sub_district_id: sub_district.id
      )
    end

    def send_request(sub_district_code)
      uri      = URI.parse("#{ENV['PROVINCES_URL']}/kabupaten/kecamatan/#{sub_district_code}/desa")
      http     = Net::HTTP.new(uri.host, uri.port)
      response = http.get(uri)
    end
  end
end
