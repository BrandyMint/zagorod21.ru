class PhotoOrder < Order
  validates :date_from, presence: true
end
