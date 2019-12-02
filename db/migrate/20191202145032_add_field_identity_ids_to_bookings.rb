class AddFieldIdentityIdsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :identity_ids, :integer, array: true, default: []
  end
end
