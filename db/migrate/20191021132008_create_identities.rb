class CreateIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :identities do |t|
      t.string :nik
      t.string :full_name
      t.string :birth_place
      t.date :birth_date
      t.string :gender
      t.string :address
      t.string :rw
      t.string :rt
      t.string :urban_village
      t.string :sub_district
      t.string :district
      t.integer :province_id
      t.integer :city_id
      t.string :religion
      t.string :martial_status
      t.string :job
      t.string :nationality

      t.timestamps
    end
  end
end
