class WelcomeController < ApplicationController

  include Concerns::HouseSearchConcern

  def index
    search_for_houses 3
    render layout: 'application_wide'
  end

  def houses_rows
    search_for_houses
    render layout: false
  end

end
