class WelcomeController < ApplicationController
  def index
    @houses = House.ordered
  end
end
