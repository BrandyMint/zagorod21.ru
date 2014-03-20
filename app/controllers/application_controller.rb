class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper
  protect_from_forgery with: :exception
  has_mobile_fu false

  helper_method :current_city, :current_user

  before_filter :add_meta_tags, :set_user_params
  HOUSES_PER_PAGE = 9
  VIEW_MODES = ['table','blocks']

  def not_found
    raise ActionController::RoutingError.new('Not Found')
    # render :status => 404
  end

  private

  def current_user
    current_admin_user
  end

  def set_user_params
    set_current_city
    set_houses_view_mode
  end

  def set_current_city
    new_city = City.where(id: params[:city]).first
    session[:current_city] = new_city if new_city
    session[:current_city] ||= City.default_city
  end

  def set_houses_view_mode
    session[:houses_view_mode] = params[:view] if VIEW_MODES.include?(params[:view])
    session[:houses_view_mode] ||= 'table'
  end

  def add_meta_tags
    path = url_for only_path: true
    mt = MetaTagPage.where(path: path).first || MetaTagPage.default

    set_meta_tags mt.fetch if mt.present?
  end
end
