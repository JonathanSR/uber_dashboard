Rails.application.config.middleware.use OmniAuth::Builder do
  provider :uber, ENV['UBER_CLIENT_ID'], ENV['UBER_CLIENT_SECRET'],
  :scope => 'profile history_lite history places all_trips request_receipt request'
end 