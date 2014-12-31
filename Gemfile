source 'https://rubygems.org'


gem 'rails',   '4.2.0'
gem 'sinatra', require: 'sinatra/base'

###########################
### pluto machinery

gem 'pluto-models'
gem 'pluto-update'
gem 'pluto-tasks'

###########################
### mount sinatra apps

gem 'pluto-admin'

gem 'about'      # mountable app - about - sys info pages
gem 'dbbrowser'  # mountable app



# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

###  todo/check - needed for rails?  - not used by pluto itself
# Use jquery as the JavaScript library
gem 'jquery-rails'



group :production do
  gem 'pg'
  gem 'thin'    # use faster multiplexed (w/ eventmachine) web server  - use unicorn?? why? why not? 
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

