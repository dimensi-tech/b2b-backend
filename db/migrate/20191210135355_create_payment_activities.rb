class CreatePaymentActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_activities do |t|
      t.integer :booking_id
      t.string :order_id
      t.decimal :amount
      t.string :payment_type
      t.string :transaction_status
      t.string :status_code

      t.timestamps
    end
  end
end
