class Page < ActiveRecord::Base
  validates :title, :body, :slug, presence: true
  validates :slug, uniqueness: true

  belongs_to :preview, class_name: 'Image'
  has_many :images, as: :resource, dependent: :destroy

  def preview
    super || Image.new
  end

  def images
    scope = super
    scope = scope.where.not(id: preview.id) if template.present?
    scope
  end
end
