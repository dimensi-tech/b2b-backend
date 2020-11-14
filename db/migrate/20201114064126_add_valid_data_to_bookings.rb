class AddValidDataToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :data_valid, :boolean, default: false
  end
end
