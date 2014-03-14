class House < ActiveRecord::Base
  include Authority::Abilities
  acts_as_taggable_on :tags

  scope :ordered, -> { active.order("price_bd DESC") }
  scope :active, -> { where active: true }
  scope :selected, -> { where selected: true }
  scope :exclude, ->(house) { where "houses.id != #{house.id}" }
  scope :by_category, ->(category) { where('houses.category_id' => category.id) }
  scope :from, ->(city) { includes(:resort).where('resorts.city_id' => city.id) }

  belongs_to :category
  belongs_to :resort
  belongs_to :preview, class_name: 'Image'

  has_many :images, as: :resource, dependent: :destroy
  has_many :booked_periods

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
    "#{title}"
  end

  def preview
    super || resort.try(:preview) || Image.new
  end

end
