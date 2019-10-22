class CreateSubDistricts < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_districts do |t|
      t.string :name
      t.string :code
      t.integer :district_id

      t.timestamps
    end
  end
end
