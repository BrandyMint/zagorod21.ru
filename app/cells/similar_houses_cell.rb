class SimilarHousesCell < Cell::Rails

  helper ApplicationHelper

  def show args
    @house = args[:house]
    @similar_houses = similar_houses.limit(3)
    render
  end

  private

  def similar_houses
    if resort_houses.present?
      resort_houses
    else
      House.active.exclude(@house)
    end
  end

  def resort_houses
    @house.resort.houses.active.exclude(@house)
  end

end
