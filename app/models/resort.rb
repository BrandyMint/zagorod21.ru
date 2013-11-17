class Resort < ActiveRecord::Base
  has_many :houses
  has_many :images, as: :resource
end
