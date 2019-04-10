class Resort < ActiveRecord::Base
  include Authority::Abilities

  scope :ordered, -> { active.order(:created_at) }
  scope :active, -> { where active: true }
  scope :with_active_houses, -> { joins(:houses).where('houses.active' => true).ordered }

  belongs_to :preview, class_name: 'Image'
  belongs_to :city
  has_many :houses
  has_many :images, as: :resource, dependent: :destroy

  validates :city_id, presence: true

  def to_s
    "#{title}"
  end

  def min_people_capacity
    houses.minimum :capacity
  end

  def max_people_capacity
    houses.maximum :capacity
  end

  def tags
    self.houses.map do |house|
      house.tags
    end.flatten.uniq
  end
end
