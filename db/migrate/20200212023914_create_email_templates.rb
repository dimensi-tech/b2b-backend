class CreateEmailTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :email_templates do |t|
      t.string :name
      t.text :body
      t.string :template_type
      t.string :attachment_file
      t.boolean :status

      t.timestamps
    end
  end
end
