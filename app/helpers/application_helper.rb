module ApplicationHelper
  def asset_exists?(path)
    Rails.application.assets.find_asset(path).present?
  end  
end
