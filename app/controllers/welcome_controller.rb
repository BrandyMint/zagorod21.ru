class WelcomeController < ApplicationController

  def index
    @search_result = SearchResult.new search_form, sort_form, {show: 3, selected: true, page: params[:page]}
    @page_transport = Page.find_by slug: :transport
    @page_food = Page.find_by slug: :food
    @page_photo = Page.find_by slug: :photo
    render layout: 'application_wide'
  end

  def houses_rows
    @search_result = SearchResult.new search_form, sort_form, filter.merge!({page: params[:page]})
    render layout: false
  end

  def sitemap
    path = Rails.root.join("public", "sitemaps", "sitemap.xml")
    if File.exists?(path)
      render xml: open(path).read
    else
      render text: "Sitemap not found.", status: :not_found
    end
  end

  private

  def filter
    return {selected: true} unless request.referer.include?('houses')
    {}
  end

end
