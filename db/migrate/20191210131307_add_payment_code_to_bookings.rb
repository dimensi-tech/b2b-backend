class AddPaymentCodeToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :payment_code, :string
  end
end
