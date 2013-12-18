class Order < ActiveRecord::Base
  belongs_to :house

  validates :name, presence: true
  validates :email, email: true, allow_blank: true
  validates :phone, presence: true, numericality: { only_integer: true }

  state_machine do
    state :new
    state :process
    state :canceled
    state :done
  end
end
