class ChangeColumnDataTypeOnBookings < ActiveRecord::Migration[6.0]
  def up
    change_column :bookings, :midtrans_id, :string
    change_column :bookings, :status, :string
  end

  def down
    change_column :bookings, :midtrans_id, :integer
    change_column :bookings, :status, :integer
  end
end
