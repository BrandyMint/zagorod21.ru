class ServicesController < ApplicationController
  def index
    @services = Service.order
  end
end
