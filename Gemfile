source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.6' ## TODO update to 4.2.7.1, see moderate security warnings from github
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'puma'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bootstrap-sass', '~> 3.3.7'
gem 'devise'
gem 'administrate', '~> 0.8.1'
gem 'carrierwave'
gem 'cloudinary'
gem 'friendly_id', '~> 5.1.0'
gem 'geocoder'
 ## NOTE yelp-ruby works with v2 but the v3 api has what we need. This is a quick port of their gem
 ## for the things Pycky needs but it doesnt cover everything. If/when yelp updates their gem, you should point
 ## there. OR, spend some time getting the entire thing updated and submit a PR to Yelp.
gem 'yelp', require: 'yelp', git: 'https://github.com/Pcushing/yelp-ruby'
gem 'rollbar'
gem 'kaminari'
gem 'gmaps4rails'
gem 'underscore-rails' ## Required by gmaps4rails

group :production do
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.4'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

