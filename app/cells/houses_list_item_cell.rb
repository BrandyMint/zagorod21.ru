class HousesListItemCell < Cell::Rails

  def show args
    @house = args[:house]
    @form_object = args[:form_object] || SearchForm.new(nil)
    @estimation = HouseCalculator.new(@house, @form_object).estimate
    render
  end

end
