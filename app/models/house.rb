class House < ActiveRecord::Base
  has_many :images

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
