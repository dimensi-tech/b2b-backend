class AddDownPaymentToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :down_payment, :decimal
  end
end
