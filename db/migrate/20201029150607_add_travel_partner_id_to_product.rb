class AddTravelPartnerIdToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :travel_partner_id, :integer
  end
end
