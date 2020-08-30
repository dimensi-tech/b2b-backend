require 'net/http'
require 'uri'

module Biodatas
  class PassengerBiodataService
    def initialize(biodata_ids:)
      @biodata_ids = biodata_ids
      @result       = []
    end

    def call
      return @result if @biodata_ids.blank?

      @biodata_ids.each do |biodata_id|
        temp_result = biodata(biodata_id).present? ? biodata(biodata_id) : nil
        @result << temp_result
      end

      @result
    end

    private

    def biodata(biodata_id)
      Biodata.find_by_id(biodata_id)
    end
  end
end
