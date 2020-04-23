class AddMidtransIdToPaymentSavings < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_savings, :midtrans_id, :integer
  end
end
