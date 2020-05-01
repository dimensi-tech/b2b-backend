class AddAdultChildPriceToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :min_child, :integer
    add_column :packages, :max_child, :integer
    add_column :packages, :adult_price, :decimal
    add_column :packages, :child_price, :decimal
  end
end
