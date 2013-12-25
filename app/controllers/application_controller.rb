class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :search_form, :sort_form, :order_form

  before_filter :add_meta_tags
  HOUSES_PER_PAGE = 8

  private

  def search_form
    @search_form ||= SearchForm.new params[:search_form]

    session[:search_form] = @search_form
  end

  def sort_form
    @sort_form ||= SortForm.new params[:sort_form]

    session[:sort_form] = @sort_form
  end

  def order_form
    params[:order] ||= {}
    @order ||= Order.new params[:order].permit! #search_form.to_order
  end

  def add_meta_tags
    path = url_for only_path: true
    mt = MetaTagPage.where(path: path).first || MetaTagPage.default

    set_meta_tags mt.fetch if mt.present?
  end
end
