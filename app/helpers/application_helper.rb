module ApplicationHelper
  def asset_exists?(path)
    Rails.application.assets.find_asset(path).present?
  end
  
  def active_class(paths = [], custom_class = nil)
    active_page = []
    paths.each do |path|
      current_route = Rails.application.routes.recognize_path(path)
      active_page << true if current_page?(path) || params[:controller] == current_route[:controller]
    end
    return unless active_page.include?(true)

    custom_class.present? ? custom_class : 'active'
  end
end
