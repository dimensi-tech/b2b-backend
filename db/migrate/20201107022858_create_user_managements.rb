class CreateUserManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :user_managements do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :role_id

      t.timestamps
    end
  end
end
