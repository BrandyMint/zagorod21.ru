class Image < ActiveRecord::Base
  belongs_to :resource, polymorphic: true

  scope :ordered, -> { order :id }

  mount_uploader :file, ImageUploader

  validates :file, presence: true
  validates :resource, presence: true

  after_create do |image|
    resource.update_attribute :preview_id, image.id
  end
end
