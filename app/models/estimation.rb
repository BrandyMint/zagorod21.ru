class Estimation 
  attr_accessor :total
  attr_accessor :house
  attr_accessor :form_object
  attr_accessor :amounts

  delegate :days, to: :form_object

  def initialize house, form_object, amounts
    @house = house
    @form_object = form_object
    @amounts = amounts
    @total = amounts.values.inject { |a,b| a+b }
  end

end
