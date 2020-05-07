class AddFieldHeirToBiodatas < ActiveRecord::Migration[6.0]
  def change
    add_column :biodata, :heir_name, :string
    add_column :biodata, :heir_contact, :string
  end
end
