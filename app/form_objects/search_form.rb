class SearchForm < FormObjectBase
  property :date_from
  property :date_to
  property :people_quantity
  property :use_transport # boolean
  property :food_state    # none, inplace, catering
  property :city
  property :price_to
  property :comfort
  property :selected

  def initialize attrs
    super attrs
    self.food_state ||= 'none'
    self.use_transport = false if self.use_transport.try(:to_i) == 0
    self.people_quantity = self.people_quantity.to_i
    self.date_from = Date.parse(date_from) if date_from.present?
    self.date_to = date_to.present? ? Date.parse(date_to) : self.date_from
  end

  def use_transport?
    !!use_transport
  end

  def days
    (date_to - date_from).to_i
  rescue
    1
  end

  def to_order
    to_h.slice('date_from','date_to','people_quantity')
  end
end
