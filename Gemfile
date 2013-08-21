source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'pg'
gem 'puma'

gem 'warden'
gem 'omniauth-identity'
gem 'omniauth-github'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-gplus'
gem 'omniauth-linkedin'

gem 'mail'
gem 'gravatar_image_tag'
gem 'geocoder'
gem 'pretty_formatter'
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"

# Gems used only for assets and not required in production environments by default.
group :assets do
  gem 'sass-rails', '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'bourbon'
  gem 'font-awesome-sass-rails'
  gem 'purecss-rails'
end

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'minitest-rails'
  gem 'minitest-capybara'
  gem 'minitest-rails-capybara'
  gem 'minitest-focus'
  gem 'minitest-colorize'
  gem 'pry-rails'
end

# Use jquery as the JavaScript library
gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

