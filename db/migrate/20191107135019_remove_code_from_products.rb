class RemoveCodeFromProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image, :string
    add_column :packages, :min_person, :integer
    add_column :packages, :max_person, :integer

    remove_column :products, :code, :string
  end
end
