module ServicesHelper
  def service_icon service
    icon = service
    case service
      when :transport
        icon = :road
      when :catering
        icon = :fire
      when :photo
        icon = 'camera-1'
      when :entertainment
        icon = 'music-1'
    end
    ficon icon
  end

end
