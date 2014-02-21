class WelcomeController < ApplicationController

  include Concerns::HouseSearchConcern

  def index
    search_for_houses show: 3, selected: true
    render layout: 'application_wide'
  end

  def houses_rows
    search_for_houses filter
    render layout: false
  end

  private

  def filter
    {selected: true} unless request.referer.include?('houses')
  end

end
