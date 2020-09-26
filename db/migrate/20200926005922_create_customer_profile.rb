class CreateCustomerProfile < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :phone_number
      t.text :company_address
      t.integer :customer_id

      t.timestamps
    end
  end
end
