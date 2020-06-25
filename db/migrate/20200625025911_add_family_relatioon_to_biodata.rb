class AddFamilyRelatioonToBiodata < ActiveRecord::Migration[6.0]
  def change
    add_column :biodata, :family_relation, :string
  end
end
