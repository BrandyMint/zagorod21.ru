class BookedPeriod < ActiveRecord::Base
  belongs_to :house

  as_enum :state, booked: 1, out_of_duty: 2, booking: 3

  validates :house, presence: true
  validates :date_from, presence: true
  validates :date_to, presence: true

  validate do
    return unless date_to.present? && date_from.present?
    self.errors.add :dates, 'Дата нача должна быть меньше даты окончания' unless date_from<=date_to
  end
end
