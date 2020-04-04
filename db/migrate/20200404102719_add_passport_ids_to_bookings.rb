class AddPassportIdsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :passport_ids, :integer, array: true, default: []
  end
end
