class House < ActiveRecord::Base

  scope :ordered, -> { order :created_at }

  has_many :images

  has_one :preview, class_name: 'Image'

  validates :title, presence: true, uniqueness: true

  def to_s
    title
  end

  def preview?
    false
  end

  def priview
    raise 'preview image'
  end
end
