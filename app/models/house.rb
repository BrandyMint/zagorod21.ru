class House < ActiveRecord::Base

  scope :ordered, -> { order :created_at }

  belongs_to :resort
  has_many :images, as: :resource
  has_one :preview, class_name: 'Image', as: :resource

  validates :title, presence: true, uniqueness: true
  validates :resort, presence: true

  delegate :distance, :time, to: :resort

  def to_s
    title
  end

  def preview
    read_attribute('preview') || resort.try(:preview) || Image.new
  end

end
