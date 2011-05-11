source 'http://rubygems.org'

gem 'rails', '3.1.0.beta1'

# Bundle edge Rails instead:
#gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'sqlite3-ruby', :require => 'sqlite3'

gem 'mysql2'
gem 'mysql'
gem 'rmagick'
gem 'paperclip'
gem 'haml-rails'

# Asset template engines
gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
group :test, :development do
  gem 'rspec-rails', '~> 2.4'
end

group :test do
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'email_spec'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end
