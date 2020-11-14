class AddTravelPartnerIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :travel_partner_id, :integer
    add_column :user_managements, :travel_partner_id, :integer
    add_column :users, :role_id, :integer
  end
end
