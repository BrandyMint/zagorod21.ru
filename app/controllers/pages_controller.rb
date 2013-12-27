class PagesController < ApplicationController
  def show
    @page = Page.find_by_slug(params[:slug])

    not_found unless @page.present?
  end
end
