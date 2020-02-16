class AddMidtransIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :midtrans_id, :integer
  end
end
