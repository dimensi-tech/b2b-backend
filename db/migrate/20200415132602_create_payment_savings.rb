class CreatePaymentSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_savings do |t|
      t.integer :booking_id
      t.integer :payment_for
      t.decimal :amount

      t.timestamps
    end
  end
end
