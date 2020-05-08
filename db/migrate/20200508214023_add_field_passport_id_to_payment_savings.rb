class AddFieldPassportIdToPaymentSavings < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_savings, :passport_id, :integer
    add_column :payment_savings, :type, :string
  end
end
