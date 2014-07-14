source 'https://rubygems.org'

gem 'rails', '4.1.4'

gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development

gem 'dotenv-rails'

gem "devise"
gem 'omniauth'
gem 'omniauth-trello'
gem 'ruby-trello', require: 'trello'

gem 'icalendar', github: 'icalendar/icalendar', require: 'icalendar'

# Fix version of nokogiri because at this time bundle goes wrong in 1.6.1 version
gem 'nokogiri', '1.5.9'

group :development, :test do
  gem "thin"
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development do
  gem "quiet_assets"
end

# Productions
group :production do
  gem 'heroku-deflater'
  gem "passenger"
  gem 'exception_notification', github: 'smartinez87/exception_notification'
  gem 'rails_12factor'
end

# Assets
gem 'modernizr-rails'
gem "compass-rails", github: "Compass/compass-rails"
gem "compass-rgbapng", require: "rgbapng"
gem 'font-awesome-rails'
gem 'bootstrap-sass', '>= 3.0'
gem "haml", ">= 3.0.0"
gem "haml-rails"

# Application stats
gem "newrelic_rpm"
