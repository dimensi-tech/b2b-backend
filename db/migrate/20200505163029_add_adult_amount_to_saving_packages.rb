class AddAdultAmountToSavingPackages < ActiveRecord::Migration[6.0]
  def change
    remove_column :saving_packages, :amount
    add_column :saving_packages, :adult_amount, :decimal
    add_column :saving_packages, :child_amount, :decimal
  end
end
