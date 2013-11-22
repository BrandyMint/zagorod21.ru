class ResortsController < ApplicationController
  def index
    @resorts = Resort.ordered
  end
end
