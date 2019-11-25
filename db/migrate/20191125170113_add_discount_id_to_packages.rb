class AddDiscountIdToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :discount_id, :integer
  end
end
