class CreatePolicies < ActiveRecord::Migration[6.0]
  def change
    create_table :policies do |t|
      t.integer :package_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
