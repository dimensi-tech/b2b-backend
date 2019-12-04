class CreateVouchers < ActiveRecord::Migration[6.0]
  def change
    create_table :vouchers do |t|
      t.string :code
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :percentage
      t.decimal :max_amount
      t.integer :max_usage
      t.boolean :status

      t.timestamps
    end
  end
end
