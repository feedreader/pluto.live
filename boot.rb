ENV['RACK_ENV'] ||= 'development'

require 'bundler'

# ruby stdlibs

require 'json'
require 'yaml'
require 'uri'
require 'logger'
require 'pp'


puts "ENV['RACK_ENV'] = #{ENV['RACK_ENV']}"

Bundler.setup
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

################################
# Database Setup n Config

db = URI.parse(ENV['DATABASE_URL'] || 'sqlite3:///pluto.db')

db_config = {}

if db.scheme == 'postgres'
  db_config = {
    adapter:  'postgresql',
    host:     db.host,
    port:     db.port,
    username: db.user,
    password: db.password,
    database: db.path[1..-1],
    encoding: 'utf8'
  }
else 
  db_config = {
    adapter:  db.scheme,       # sqlite3
    database: db.path[1..-1]   # sport.db (NB: cut off leading /, thus 1..-1)
  }
end

pp db_config
ActiveRecord::Base.establish_connection( db_config )

## for debugging - disable for production use
ActiveRecord::Base.logger = Logger.new( STDOUT )


unless Pluto::Models::Feed.table_exists?
  Pluto::CreateDb.new.up  # run db migratation, that is, create db tables 
end


### load server

require 'pluto/server'

