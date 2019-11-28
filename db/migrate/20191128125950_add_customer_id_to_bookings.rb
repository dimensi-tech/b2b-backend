class AddCustomerIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :customer_id, :integer
    add_column :bookings, :adult, :integer
    add_column :bookings, :child, :integer
    add_column :bookings, :departure_date, :date
  end
end
