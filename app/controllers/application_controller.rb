class ApplicationController < ActionController::Base
  around_action :switch_locale

  before_action :authenticate_user!
  before_action :set_breadcrumbs

  def default_url_options
    { locale: I18n.locale }
  end

  protected

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def set_breadcrumbs
    breadcrumb 'home', :root_path
    breadcrumb "#{controller_name}.index", controller_path.to_sym

    case action_name
    when 'show'
      breadcrumb "#{controller_name}.show", "/#{params[:locale]}/#{controller_path}/#{params[:id]}"
    when 'new', 'create'
      breadcrumb "#{controller_name}.new", "/#{params[:locale]}/#{controller_path}/new"
    when 'edit', 'update'
      breadcrumb "#{controller_name}.edit", "/#{params[:locale]}/#{controller_path}/#{params[:id]}/edit"
    end
  end
end
