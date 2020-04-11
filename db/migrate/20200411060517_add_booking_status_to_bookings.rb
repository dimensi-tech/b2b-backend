class AddBookingStatusToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :booking_status, :integer
  end
end
