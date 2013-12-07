class Service < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :key, presence: true, uniqueness: true


  def self.[] key
    Settings.services.send(key) || raise("Нет сервиса с ключем #{key}")
  end
end
