require 'net/http'
require 'uri'

module Addresses
  class GetProvincesService
    def initialize
      @result = { saved_rows: [], failed_rows: [] }
    end

    def call
      response = send_request

      if response.is_a?(Net::HTTPOK)
        JSON.parse(response.body)['semuaprovinsi'].each do |province|
          create_province(province)
        end
      end
    end

    private

    def create_province(province)
      Province.find_or_create_by(
        code: province['id'],
        name: province['nama']
      )
    end

    def send_request
      uri      = URI.parse("#{ENV['PROVINCES_URL']}")
      http     = Net::HTTP.new(uri.host, uri.port)
      response = http.get(uri)
    end
  end
end
