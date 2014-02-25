ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = ENV[MANDRILL_API_KEY]
end