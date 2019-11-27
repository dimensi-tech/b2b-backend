class AddDownPaymentToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :down_payment, :decimal
  end
end
