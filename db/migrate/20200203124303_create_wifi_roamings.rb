class CreateWifiRoamings < ActiveRecord::Migration[6.0]
  def change
    create_table :wifi_roamings do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
