require './boot'

############################
# settings 

INSTALL_DIR   = File.expand_path( File.dirname(__FILE__))
PUBLIC_FOLDER = "#{INSTALL_DIR}/public"
VIEWS_FOLDER  = "#{INSTALL_DIR}/templates"

puts <<EOS
Settings:

  INSTALL_DIR:   #{INSTALL_DIR}
  PUBLIC_FOLDER: #{PUBLIC_FOLDER}
  VIEWS_FOLDER:  #{VIEWS_FOLDER}
EOS


puts "[boot] pluto-service - (re)setting public folder to: #{PUBLIC_FOLDER}"
puts "[boot] pluto-service - (re)setting views folder to: #{VIEWS_FOLDER}"

Pluto::Server.set :public_folder, PUBLIC_FOLDER   # set up the static dir (with images/js/css inside)   
Pluto::Server.set :views,         VIEWS_FOLDER    # set up the views dir


################
# Database Setup n Config

# todo/fix: use Pluto::Server.connect!!  as an alias for Pluto.connect!  why? why not?
#  move connect up (e.g. before Server.set etc.) - connection needed? why? why not?

Pluto.connect!   # try connect w/ DATABASE_URL


run Pluto::Server
