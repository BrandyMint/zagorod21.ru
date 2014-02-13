class SimilarHousesCell < Cell::Rails

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
      House.active
    end
  end

  def resort_houses
    @house.resort.houses.where("houses.id != #{@house.id}")
  end

end
