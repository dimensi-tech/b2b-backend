class AddUrlToAds < ActiveRecord::Migration[6.0]
  def change
    add_column :ads, :url, :string
  end
end
