class Resort < ActiveRecord::Base
  scope :ordered, -> { order :created_at }

  has_many :houses
  has_many :images, as: :resource
  has_one :preview, class_name: 'Image', as: :resource

  def to_s
    "#{title} (база)"
  end
end
