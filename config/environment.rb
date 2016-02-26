# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.default_url_options[:host] = "localhost:3000"
ActionMailer::Base.perform_deliveries = true

ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :domain         => 'heroku.com',
    :port           => 587,
    :user_name      => ENV['GMAIL_USERNAME'],
    :password       => ENV['GMAIL_PASSWORD'],
    :authentication => :login,
    enable_starttls_auto: true,
    :openssl_verify_mode => 'none'
}
