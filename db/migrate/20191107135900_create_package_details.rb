class CreatePackageDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :package_details do |t|
      t.integer :package_id
      t.string :day
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
