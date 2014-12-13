source 'https://rubygems.org'

gem 'sinatra', :require => 'sinatra/base'

gem 'pluto-models'
gem 'pluto-update'
gem 'pluto-tasks'

gem 'pluto'
gem 'pluto-admin'  ## todo/fix: update admin - require pluto-models etc.


gem 'about'      # mountable app - about - sys info pages
gem 'dbbrowser'  # mountable app


group :production do
  gem 'pg'
  gem 'thin'    # use faster multiplexed (w/ eventmachine) web server 
end

group :development do
  gem 'sqlite3'
end
