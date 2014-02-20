class Date
  def is_weekend?
    [0, 6, 7].include?(wday)
  end
end