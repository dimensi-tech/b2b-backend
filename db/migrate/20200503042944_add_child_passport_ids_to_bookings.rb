class AddChildPassportIdsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :child_passport_ids, :integer, array: true, default: []
  end
end
