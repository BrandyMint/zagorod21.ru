class Service < ActiveRecord::Base
  scope :main, -> { order(:position).where( main: true ) }

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :key, presence: true, uniqueness: true

  before_save do
    self.key ||= self.title
  end

  def self.[] key
    Settings.services.send(key) || raise("Нет сервиса с ключем #{key}")
  end
end
