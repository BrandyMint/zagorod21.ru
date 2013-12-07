class Service < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :key, presence: true, uniqueness: true
end
