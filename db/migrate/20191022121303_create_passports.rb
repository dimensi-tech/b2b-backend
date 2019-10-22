class CreatePassports < ActiveRecord::Migration[6.0]
  def change
    create_table :passports do |t|
      t.string :full_name
      t.string :birth_place
      t.string :mother_name
      t.string :father_name
      t.string :number
      t.date :expired_date
      t.date :birth_date
      t.integer :identity_id

      t.timestamps
    end
  end
end
