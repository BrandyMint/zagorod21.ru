module Concerns
  module HouseSearchConcern
    extend ActiveSupport::Concern

    included do
      private

      def search_for_houses options=nil
        search_form
        @search_form.selected = true if options.try(:[], :selected).present?
        hsq = HouseSearchQuery.new(@search_form, sort_form).estimates
        @all_houses = House.includes(:resort).active.count
        @matched_houses = hsq.count
        @page = params[:page] || 1
        @estimates = Kaminari.paginate_array(hsq).page(@page).per(options.try(:[], :show) || ApplicationController::HOUSES_PER_PAGE)
      end
    end

  end
end
