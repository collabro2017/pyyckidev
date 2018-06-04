# require 'yelp'

Yelp.client.configure do |config|
  config.client_id = ENV['YELP_CLIENT_ID']
  config.api_key = ENV['YELP_API_KEY']
end unless Rails.env.test?
