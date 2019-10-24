namespace :addresses do
  desc 'Get all complete addresses'
  task get_complete_addresses: :environment do
    Addresses::GetProvincesService.new.call
    Addresses::GetDistrictsService.new.call
    Addresses::GetSubDistrictsService.new.call
    Addresses::GetUrbanVillagesService.new.call
  end
end
