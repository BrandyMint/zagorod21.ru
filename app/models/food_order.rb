class FoodOrder < Order
  validates :date_from, presence: true
end
