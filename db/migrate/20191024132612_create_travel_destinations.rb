class CreateTravelDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :travel_destinations do |t|
      t.integer :country_id
      t.string :destination

      t.timestamps
    end
  end
end
