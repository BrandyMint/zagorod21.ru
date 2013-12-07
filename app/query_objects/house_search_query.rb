class HouseSearchQuery

  def initialize form_object
    @form_object = form_object
  end

  def perform
    House.ordered.map do |h|
      HouseCalculator.new( h, @form_object ).estimate
    end
  end

end
