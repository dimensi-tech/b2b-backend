class AddIsConfirmedToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :is_confirmed, :boolean
    add_column :customers, :confirmed_at, :datetime
  end
end
