class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.decimal :percentage
      t.boolean :status
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
