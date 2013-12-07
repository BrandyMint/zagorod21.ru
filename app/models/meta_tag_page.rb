class MetaTagPage < ActiveRecord::Base
  validates :path, presence: true

  ATTRIBUTES = %w(site title description keywords prefix
  separator suffix noindex nofollow canonical prev next)

  def self.default
    @default ||= where(path: '*').first
  end

  def fetch
    attributes.select { |k,v| ATTRIBUTES.include?(k) && v.present? }.symbolize_keys
  end
end
