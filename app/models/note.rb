class Note < ActiveRecord::Base
  default_scope { order("RANDOM()") }
  validates :text, presence: true
end
