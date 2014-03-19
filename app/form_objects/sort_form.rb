class SortForm < FormObjectBase
  property :order # asc/desc
  property :column

  ORDERS = %w[asc desc]

  SORTABLE_COLUMNS = %w[title price_bd price_wd distance capacity selected]

  def valid?
    SORTABLE_COLUMNS.include?(self.column) && ORDERS.include?(self.order)
  end

  def reverse_order!
    if self.order == 'asc'
      self.order = 'desc'
    else
      self.order = 'asc'
    end
  end

end
