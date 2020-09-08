require 'net/http'
require 'uri'

module Savings
  class PassengerSavingService
    def initialize(booking_id:, source_ids:, source_type:)
      @booking_id  = booking_id
      @source_ids  = source_ids
      @source_type = source_type
      @result      = []
    end

    def call
      return @result if @source_ids.blank?

      @source_ids.each do |source_id|
        temp_response = nil
        response      = send_request(source_id)

        if response.is_a?(Net::HTTPOK) && !JSON.parse(response.body).try(:has_value?, false)
          temp_response = JSON.parse(response.body)
        end

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

    def set_parameter(source_id)
      temp_params = {
        booking_id: @booking_id,
        identity_id: source_id
      }

      temp_params = {
        booking_id: @booking_id,
        passport_id: source_id
      } if @source_type == 'child'

      temp_params
    end

    def send_request(source_id)
      uri          = URI.parse("#{ENV['KYC_BACKEND_API_URL']}/v1/bookings/savings_customer")
      uri.query    = URI.encode_www_form(set_parameter(source_id))
      http         = Net::HTTP.new(uri.host, uri.port)
      # http.use_ssl = true
      http.get(uri, set_header)
    end
  end
end
