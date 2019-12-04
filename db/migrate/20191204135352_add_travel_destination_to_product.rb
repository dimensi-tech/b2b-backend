class AddTravelDestinationToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :travel_destination_id, :integer
  end
end
