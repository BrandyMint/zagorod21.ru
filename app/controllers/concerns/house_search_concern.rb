module Concerns
  module HouseSearchConcern
    extend ActiveSupport::Concern

    included do
      private

      def search_for_houses count=nil
        hsq = HouseSearchQuery.new search_form, sort_form
        @all_houses = House.includes(:resort).active.count
        @matched_houses = hsq.estimates.count
        @page = params[:page] || 1
        @estimates = Kaminari.paginate_array(hsq.estimates).page(@page).per(count || ApplicationController::HOUSES_PER_PAGE)
      end
    end

  end
end
