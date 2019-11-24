class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :name
      t.string :image
      t.boolean :status

      t.timestamps
    end
  end
end
