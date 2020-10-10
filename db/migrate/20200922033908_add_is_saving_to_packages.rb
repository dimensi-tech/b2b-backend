class AddIsSavingToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :is_saving, :boolean
    add_column :packages, :down_payment_flat, :decimal
    add_column :packages, :down_payment_percentage, :float
    add_column :packages, :down_payment_type, :string
  end
end
