class Image < ActiveRecord::Base
  belongs_to :house

  mount_uploader :file, ImageUploader

  validates :file, presence: true
end
