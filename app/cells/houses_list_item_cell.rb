class HousesListItemCell < Cell::Rails

  helper ApplicationHelper

  def show args
    @house = args[:house]
    @form_object = args[:form_object]
    @estimation = HouseCalculator.new(@house, @form_object).estimate
    render
  end

end
