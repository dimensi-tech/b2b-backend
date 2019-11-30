class ChangeTypeAvailableDateOnPackages < ActiveRecord::Migration[6.0]
  def change
    remove_column :packages, :available_date, :string, array: true, default: []
    add_column :packages, :available_date, :string, array: true, default: '{}'
  end
end
