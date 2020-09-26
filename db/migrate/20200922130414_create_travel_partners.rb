class CreateTravelPartners < ActiveRecord::Migration[6.0]
  def change
    create_table :travel_partners do |t|
      t.string :name
      t.string :logo
      t.text :address
      t.text :description

      t.timestamps
    end
  end
end
