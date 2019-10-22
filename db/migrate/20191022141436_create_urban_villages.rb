class CreateUrbanVillages < ActiveRecord::Migration[6.0]
  def change
    create_table :urban_villages do |t|
      t.string :name
      t.string :code
      t.integer :sub_district_id

      t.timestamps
    end
  end
end
