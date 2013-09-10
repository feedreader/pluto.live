
############################
# settings 

PLANET_KEY  = 'ruby'
INSTALL_DIR = File.expand_path( File.dirname(__FILE__))

##############################

PUBLIC_FOLDER = "#{INSTALL_DIR}/public"
VIEWS_FOLDER  = "#{INSTALL_DIR}/templates"
PLANET_CONFIG = "#{INSTALL_DIR}/#{PLANET_KEY}.yml"

puts <<EOS
Settings:

  INSTALL_DIR: #{INSTALL_DIR}
  PLANET_KEY:  #{PLANET_KEY}

  ---
  PUBLIC_FOLDER: #{PUBLIC_FOLDER}
  VIEWS_FOLDER:  #{VIEWS_FOLDER}
  PLANET_CONFIG: #{PLANET_CONFIG} 
EOS


require './boot'


puts "[boot] pluto-service - (re)setting public folder to: #{PUBLIC_FOLDER}"
puts "[boot] pluto-service - (re)setting views folder to: #{VIEWS_FOLDER}"

Pluto::Server.set :public_folder, PUBLIC_FOLDER   # set up the static dir (with images/js/css inside)   
Pluto::Server.set :views,         VIEWS_FOLDER    # set up the views dir

config = YAML.load_file( PLANET_CONFIG )

pp config

Pluto::Server.set :site_config, config


run Pluto::Server
