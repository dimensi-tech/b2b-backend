class CreateSavingPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :saving_packages do |t|
      t.integer :package_id
      t.integer :sort
      t.decimal :amount

      t.timestamps
    end
  end
end
