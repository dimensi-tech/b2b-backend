require 'net/http'
require 'uri'

module Addresses
  class GetDistrictsService
    def initialize
      @provinces = Province.all
      @result    = { saved_rows: [], failed_rows: [] }
    end

    def call
      if @provinces.present?
        @provinces.each do |province|
          response = send_request(province.code)

          if response.is_a?(Net::HTTPOK)
            JSON.parse(response.body)['kabupatens'].each do |district|
              create_district(district, province)
            end
          end
        end
      end
    end

    private

    def create_district(district, province)
      District.find_or_create_by(
        code: district['id'],
        name: district['nama'],
        province_id: province.id
      )
    end

    def send_request(province_code)
      uri      = URI.parse("#{ENV['PROVINCES_URL']}/#{province_code}/kabupaten")
      http     = Net::HTTP.new(uri.host, uri.port)
      response = http.get(uri)
    end
  end
end
