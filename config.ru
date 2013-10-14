require './boot'

### todo: check how we can auto-connect in Planet
#  use activerecord.connected? or similar?

Pluto.connect!   # try connect w/ DATABASE_URL


####
# todo/fix: move into pluto.connect!

def add_db_config()
  db = URI.parse( ENV['DATABASE_URL'] || 'sqlite3:///pluto.db' )

  ### use spec instead of config ???

  if db.scheme == 'postgres'
    config = {
          adapter:  'postgresql',
          host:     db.host,
          port:     db.port,
          username: db.user,
          password: db.password,
          database: db.path[1..-1],
          encoding: 'utf8'
        }
  else 
      config = {
        adapter:  db.scheme,       # sqlite3
        database: db.path[1..-1]   # pluto.db (NB: cut off leading /, thus 1..-1)
      }
  end

  puts 'db settings:'
  pp config

  if ActiveRecord::Base.configurations.nil?
    puts "ActiveRecord configurations nil - set to empty hash"
    ActiveRecord::Base.configurations = {}  # make it an empty hash
  end

  puts 'ar configurations (before):'
  pp ActiveRecord::Base.configurations

  ActiveRecord::Base.configurations['pluto'] = config

  puts 'ar configurations (after):'
  pp ActiveRecord::Base.configurations
end

add_db_config()


map '/' do

  run Planet

  map '/db' do
    run PlutoAdmin::Server
  end
  
  map '/sysinfo' do
    run About::Server
  end
  
  map '/browse' do
    run DbBrowser::Server
  end

end
