class WelcomeController < ApplicationController

  include Concerns::HouseSearchConcern
  respond_to :html, :txt

  def index
    search_for_houses show: 3, selected: true
    render layout: 'application_wide'
  end

  def houses_rows
    search_for_houses filter
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
