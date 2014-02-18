class Order < ActiveRecord::Base

  validates :name, presence: true
  validates :phone, presence: true, length: {is: 10}

  def phone= phone
    super phone[4,3].to_s + phone[9,3].to_s + phone[13,2].to_s + phone[16,2].to_s
  end

  state_machine do
    state :new
    state :process
    state :canceled
    state :done
  end
end
