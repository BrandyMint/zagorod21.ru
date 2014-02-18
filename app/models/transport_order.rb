class TransportOrder < Order
  validates :date_from, :date_to, presence: true
  validate do
    self.errors.add :dates, 'Необходимо выбрать даты пребывания' unless date_from || date_to
  end
end