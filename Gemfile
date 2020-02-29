# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano', '~> 3.10'
  gem 'capistrano-bundler', '~> 1.4'
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano3-puma', '~> 3.1.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Add
gem 'axlsx', git: 'https://github.com/randym/axlsx.git', ref: 'c8ac844' # converter html to excel
gem 'caxlsx_rails' #convert to xlsx spreadsheets
gem 'carrierwave', '~> 2.0' # image file uploader
gem 'carrierwave-i18n', '0.2.0' # image file uploader
gem 'city-state', '0.0.13'
gem 'ckeditor', '4.3.0' # text editor
gem 'cocoon' # nested form
gem 'countries', '3.0.0'
gem 'devise', '4.7.1' # user authentication
gem 'dotenv-rails', '2.7.4' # dotenv hiding secrets key
gem 'enumerize', '2.3.1' # Enumerated attributes
gem 'jquery-ui-rails' # jquery ui
gem 'kaminari', '1.1.1' # Pagination
gem 'loaf', '~> 0.8.1' # breadcrumb
gem 'mini_magick', '4.9.5' # image file uploader
gem 'rails-i18n', '~> 6.0.0' # Translations
gem 'ransack', '2.3.0' # Ransack
gem 'rolify', '5.2.0' # user roles
gem 'simple_form', '4.1.0' # simple form on all form
gem 'slim-rails', '3.2.0' # slim language
gem 'uglifier', '~> 4.1', '>= 4.1.20'
