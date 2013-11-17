class WelcomeController < ApplicationController
  def index
    @houses = House.ordered

    @resorts = Resort.ordered
  end
end
