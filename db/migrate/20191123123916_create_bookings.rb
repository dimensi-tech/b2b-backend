class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :number
      t.integer :package_id
      t.integer :user_id

      t.timestamps
    end
  end
end
