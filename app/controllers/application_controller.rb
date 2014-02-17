class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper
  protect_from_forgery with: :exception

  helper_method :search_form, :sort_form, :order_form, :current_city, :current_user

  before_filter :add_meta_tags, :set_current_city
  HOUSES_PER_PAGE = 9

  def not_found
    raise ActionController::RoutingError.new('Not Found')
    # render :status => 404
  end

  private

  def current_user
    current_admin_user
  end

  def set_current_city
    new_city = City.where(id: params[:city]).first
    session[:current_city] = new_city if new_city
    session[:current_city] ||= City.default_city
  end

  def sort_form
    @sort_form ||= SortForm.new params[:sort_form]

    session[:sort_form] = @sort_form
  end

  def order_form
    params[:order] ||= {}
    @order ||= Order.new params[:order].permit(Order.attribute_names) #search_form.to_order
  end

  def add_meta_tags
    path = url_for only_path: true
    mt = MetaTagPage.where(path: path).first || MetaTagPage.default

    set_meta_tags mt.fetch if mt.present?
  end
end
