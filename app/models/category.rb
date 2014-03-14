class Category < ActiveRecord::Base
  has_many :houses

  validate :name, presence: true
end
