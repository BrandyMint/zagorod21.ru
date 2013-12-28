class AdminUser < ActiveRecord::Base
  include Authority::UserAbilities

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  scope :order_notify, -> {where(accept_orders: true)}

  validate do
    if self.class.attribute_names.include?('accept_orders') && accept_orders_changed? && accept_orders && (phone.blank? || email.blank?)
      self.errors.add :accept_orders, 'Чтобы получить сообщений о заказах, необходимо заполнить email и телефон.'
    end
  end

  def is_admin?
    true
  end
end
