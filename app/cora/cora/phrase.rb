class Cora::Phrase < ActiveRecord::Base
  validates :locale, presence: true
  validates :key, presence: true, uniqueness: { scope: :locale }
  validates :value, presence: true

  def title
    [locale,key].join ':'
  end
end
