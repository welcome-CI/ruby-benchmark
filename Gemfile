source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '7.0.3'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'jsbundling-rails'
gem 'pg'
gem 'puma'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'haml-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console'

  gem 'haml_lint', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'

  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
