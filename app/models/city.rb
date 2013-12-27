class City < ActiveRecord::Base  
  scope :default_city, -> {where(slug: Settings.default.current_city).last}

  validates :title, :slug, presence: true
  validates :slug, :title, uniqueness: true
  has_many :resorts
end
