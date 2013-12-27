class Resort < ActiveRecord::Base
  scope :ordered, -> { active.order(:created_at) }
  scope :active, -> { where active: true }
  scope :with_active_houses, -> {joins(:houses).where('houses.active' => true).uniq.ordered}

  has_many :houses
  has_many :images, as: :resource, dependent: :destroy
  belongs_to :preview, class_name: 'Image'
  belongs_to :city

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
