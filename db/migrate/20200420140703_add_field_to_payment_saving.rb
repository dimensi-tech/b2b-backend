class AddFieldToPaymentSaving < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_savings, :identity_id, :integer
    add_column :payment_savings, :status, :integer
  end
end
