class CreateVoucherUsage < ActiveRecord::Migration[6.0]
  def change
    create_table :voucher_usages do |t|
      t.integer :customer_id
      t.integer :voucher_id

      t.timestamps
    end
  end
end
