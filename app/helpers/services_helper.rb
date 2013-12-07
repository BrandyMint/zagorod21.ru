module ServicesHelper
  def service_icon service, color = false
    icon = service
    case service
      when :transport
        icon = :road
        color = :black
      when :food
        color = :orange
      when :catering
        icon = :fire
        color = :red
      when :photo
        icon = 'camera-1'
        color = :blue
      when :amusement
        icon = 'music-1'
        color = :cyan
    end
    if color
      ficon icon, color: color
    else
      ficon icon
    end
  end

end
