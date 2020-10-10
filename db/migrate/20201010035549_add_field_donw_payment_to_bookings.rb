class AddFieldDonwPaymentToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :dp_amount, :decimal
    add_column :bookings, :child_amount_saving, :decimal
    add_column :bookings, :adult_amount_saving, :decimal
  end
end
