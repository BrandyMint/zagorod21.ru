class Resort < ActiveRecord::Base
  scope :ordered, -> { active.order(:created_at) }
  scope :active, -> { where active: true }

  has_many :houses
  has_many :images, as: :resource
  has_one :preview, class_name: 'Image', as: :resource

  def to_s
    "#{title} (база)"
  end

  def min_people_capacity
    houses.minimum :capacity
  end

  def max_people_capacity
    houses.maximum :capacity
  end
end
