class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :code
      t.text :description

      t.timestamps
    end
  end
end
