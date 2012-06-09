source 'http://rubygems.org'

gem 'rails', '3.1.1'


group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

gem 'haml'
gem 'execjs'
gem 'therubyracer'
gem 'heroku', :group => [:development]

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'pry-rails'
end

group :test do
  gem 'turn', :require => false
end

group :test do
  gem 'minitest'
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'ramaze'
  gem 'webrat'
  gem 'capybara'
  gem 'capybara-webkit'
  gem "headless"
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'spork'
  gem 'fakeweb'

  gem "simplecov", :require => false
  gem 'launchy' # So you can do Then show me the page

  gem 'rails-sh'
end


