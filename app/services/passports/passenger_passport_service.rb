require 'net/http'
require 'uri'

module Passports
  class PassengerPassportService
    def initialize(identity_ids:)
      @identity_ids = identity_ids
      @result       = []
    end

    def call
      return @result if @identity_ids.blank?

      @identity_ids.each do |identity_id|
        temp_response = nil
        response      = send_request(identity_id)
        temp_response = JSON.parse(response.body) if response.is_a?(Net::HTTPOK)

        @result << temp_response
      end

      @result
    end

    private

    def set_header
      {
        "Content-type" => "application/json",
        "Accept" => "application/json"
      }
    end

    def set_parameter(identity_id)
      {
        id: identity_id
      }
    end

    def send_request(identity_id)
      uri          = URI.parse("#{ENV['BACKEND_API_URL']}/api/v1/passports/find_passport")
      uri.query    = URI.encode_www_form(set_parameter(identity_id))
      http         = Net::HTTP.new(uri.host, uri.port)
      # http.use_ssl = true
      http.get(uri, set_header)
    end
  end
end
