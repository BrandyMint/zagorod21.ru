class House < ActiveRecord::Base
  include Authority::Abilities

  scope :ordered, -> { active.order("price_bd DESC") }
  scope :active, -> { where active: true }
  scope :from, -> (city) {includes(:resort).where('resorts.city_id' => city.id)}

  belongs_to :resort
  belongs_to :preview, class_name: 'Image'
  has_many :images, as: :resource, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :resort_id }
  validates :resort, presence: true

  delegate :distance, :time, to: :resort

  def self.min_people_capacity
    active.minimum :capacity
  end

  def self.max_people_capacity
    active.maximum :capacity
  end

  def to_s
    "#{title} (дом)"
  end

  def preview
    super || resort.try(:preview) || Image.new
  end

end
