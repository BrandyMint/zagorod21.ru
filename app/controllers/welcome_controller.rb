class WelcomeController < ApplicationController
  def index
    @houses = House.order(:created_at)
  end
end
