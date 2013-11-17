class Order < ActiveRecord::Base
  belongs_to :house

  validates :phone, presence: true
  validates :name, presence: true

  state_machine do
    state :new
    state :process
    state :canceled
    state :done
  end
end
