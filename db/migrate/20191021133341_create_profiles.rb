class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :identity_id
      t.integer :passport_id
      t.string :avatar
      t.string :telephone_number
      t.string :phone_number

      t.timestamps
    end
  end
end
