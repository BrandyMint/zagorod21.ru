class Page < ActiveRecord::Base
  validates :title, :body, :slug, presence: true
  validates :slug, uniqueness: true
end
