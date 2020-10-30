class ChangeDataTypeDurationTripPackage < ActiveRecord::Migration[6.0]
  def change
    change_column :packages, :duration_trip, :integer, using: 'duration_trip::integer'
  end
end
