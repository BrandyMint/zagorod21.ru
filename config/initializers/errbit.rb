if defined? Airbrake
  Airbrake.configure do |config|
    config.api_key = 'e368d448b78e72f3dcb160e66acd93c6'
    config.host    = 'errbit.brandymint.ru'
    config.port    = 80
    config.secure  = config.port == 443
  end
end
