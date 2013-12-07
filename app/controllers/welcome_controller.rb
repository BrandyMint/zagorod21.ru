class WelcomeController < ApplicationController
  def index
    hsq = HouseSearchQuery.new search_form

    @estimates = hsq.perform
  end

  def contact

  end

  private

  def search_form
    @search_form ||=  SearchForm.new params[:search_form]
  end
end
