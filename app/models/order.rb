class Order < ActiveRecord::Base
  belongs_to :house

  validates :name, :money_amount, presence: true
  validates :date_from, :date_to, presence: true
  validate do
    self.errors.add :dates, 'Необходимо выбрать даты пребывания' unless date_from && date_from
  end

  validates :email, email: true, allow_blank: true
  validates :phone, presence: true,  length: {is: 10}

  state_machine do
    state :new
    state :process
    state :canceled
    state :done
  end
end
