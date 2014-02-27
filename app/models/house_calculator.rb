class HouseCalculator
  attr_reader :form_object
  attr_reader :estimation

  delegate :days, :food_state, :people_quantity, :use_transport, :date_from, :date_to, to: :form_object

  def initialize house, form_object
    @house = house
    @form_object = form_object
    @estimation = nil
  end

  def estimate
    @estimation = Estimation.new @house, @form_object, dates: summa_by_dates, transport: summa_of_transport, food: summa_of_food
  end

  private

  def summa_of_food
    if food_state.to_sym == :inplace
      days * Service[:food_inplace]
    elsif food_state.to_sym == :catering
      days * people_quantity * Service[:food_catering]
    else
      0
    end
  end

  def summa_of_transport
    if use_transport
      2 * @house.resort.distance * Service[:transport]
    else
      0
    end
  end

  def summa_by_dates
    return @house.price_wd if date_from.blank?

    summa = 0
    (date_from..end_of_range).map { |d|
      summa += summa_of_date(d)
    }
    return summa
  end

  def summa_of_date date
    date.is_weekend? ? @house.price_wd : @house.price_bd
  end

  def end_of_range
    date_from == date_to ? date_to : date_to - 1.day
  end
end
