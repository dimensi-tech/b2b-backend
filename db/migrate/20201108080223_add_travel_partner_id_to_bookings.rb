class AddTravelPartnerIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :travel_partner_id, :integer
  end
end
