class Image < ActiveRecord::Base
  belongs_to :house

  mount_uploader :file, ImageUploader

  validates :file, presence: true

  after_create do |image|
    house.update_attribute :preview_id, image.id
  end
end
