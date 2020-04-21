class AddFieldToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :booking_type, :integer
    add_column :bookings, :saving_package_id, :integer
  end
end
