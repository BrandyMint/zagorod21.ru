class ServicesController < ApplicationController
  def index
    @services = Service.ordered
  end
end
