# frozen_string_literal: true# generate data countries

namespace :get_countries do
  desc 'Import Countries Data'
  task import_countries: :environment do
    CS.countries.each_with_index do |value, _index|
      next if value[1] == 'country_name'

      Country.find_or_create_by(code: value[0], name: value[1])
    end
  end
end
