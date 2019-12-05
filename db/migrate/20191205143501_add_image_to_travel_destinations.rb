class AddImageToTravelDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :travel_destinations, :image, :string
  end
end
