source 'https://rubygems.org'

gem 'sinatra', :require => 'sinatra/base'

gem 'pluto'
gem 'pluto-admin'


gem 'activerecord'

group :production do
  gem 'pg'
  gem 'thin'    # use faster multiplexed (w/ eventmachine) web server 
end

group :development do
  gem 'sqlite3'
end
