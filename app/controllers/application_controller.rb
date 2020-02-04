class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_breadcrumbs

  protected

  def set_breadcrumbs
    breadcrumb 'home', :root_path
    breadcrumb "#{controller_name}.index", controller_path.to_sym

    case action_name
    when 'show'
      breadcrumb "#{controller_name}.show", "/#{controller_path}/#{params[:id]}"
    when 'new', 'create'
      breadcrumb "#{controller_name}.new", "/#{controller_path}/new"
    when 'edit', 'update'
      breadcrumb "#{controller_name}.edit", "/#{controller_path}/#{params[:id]}/edit"
    end
  end
end
