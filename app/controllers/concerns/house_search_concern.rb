module Concerns
  module HouseSearchConcern
    extend ActiveSupport::Concern

    included do
      private

      def search_for_houses options={}
        search_form
        @search_form.selected = options.fetch(:selected, nil)
        hsq = HouseSearchQuery.new(@search_form, sort_form).estimates

        return SearchResult.new(
          all_houses: House.by_category(@search_form.category).includes(:resort).active.count,
          matched_houses: hsq.count,
          page: params[:page] || 1,
          estimates: Kaminari.paginate_array(hsq).page(@page).per options.fetch(:show, ApplicationController::HOUSES_PER_PAGE),
        )
        return hash
      end
    end

  end
end
