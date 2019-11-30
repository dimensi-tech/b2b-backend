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

  def default_currency(value)
    ActionController::Base.helpers.number_to_currency(value, unit: 'Rp ', delimiter: '.', precision: 0)
  end

  def default_date(value)
    value.strftime('%d %B %Y')
  end

  def default_datetime(value)
    value.strftime('%I:%M %p %A, %d %B %Y')
  end
end
