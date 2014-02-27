ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.apikey = ENV['MANDRILL_APIKEY']
end