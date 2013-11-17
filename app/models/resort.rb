class Resort < ActiveRecord::Base
  has_many :houses
  has_many :images, as: :resource
  has_one :preview, class_name: 'Image', as: :resource
end
