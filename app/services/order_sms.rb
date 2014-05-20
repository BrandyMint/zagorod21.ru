class OrderSMS
  def self.send_sms message, phone=Settings.sms_phone
    params = Rails.env == 'production' ? {} : {test: 1}
    Rails.logger.info "SEND SMS: #{phone}: #{message}"
    LittleSms.send_sms(phone, message, params)
  end
end
