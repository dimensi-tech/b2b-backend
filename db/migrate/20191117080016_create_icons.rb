class CreateIcons < ActiveRecord::Migration[6.0]
  def change
    create_table :icons do |t|
      t.string :code
      t.text :description

      t.timestamps
    end
  end
end
