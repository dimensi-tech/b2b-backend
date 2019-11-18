class AddFieldsOnPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :available_date, :string
    add_column :packages, :duration_trip, :string
  end
end
