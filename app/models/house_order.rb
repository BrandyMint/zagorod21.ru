class HouseOrder < Order
  belongs_to :house

  validates :house, presence: true
  validates :money_amount, presence: true
  validates :date_from, :date_to, presence: true
  delegate :resort, to: :house
  validate do
    self.errors.add :dates, 'Необходимо выбрать даты пребывания' unless date_from || date_to
  end

  validates :email, email: true, allow_blank: true

end
