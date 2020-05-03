class AddBioIdsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :adult_bio_ids, :integer, array: true, default: []
    add_column :bookings, :child_bio_ids, :integer, array: true, default: []
  end
end
