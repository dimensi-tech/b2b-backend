class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.integer :package_id
      t.string :name
      t.text :description
      t.string :icon

      t.timestamps
    end
  end
end
