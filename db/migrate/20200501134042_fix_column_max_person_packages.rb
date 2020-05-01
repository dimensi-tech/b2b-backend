class FixColumnMaxPersonPackages < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :packages, :min_person, :min_adult
    rename_column :packages, :max_person, :max_adult
  end
end
