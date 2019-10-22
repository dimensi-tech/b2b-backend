class CreateTermAgreements < ActiveRecord::Migration[6.0]
  def change
    create_table :term_agreements do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
