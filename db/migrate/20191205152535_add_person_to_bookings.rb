class AddPersonToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :voucher_id, :integer
    add_column :bookings, :person, :integer
  end
end
