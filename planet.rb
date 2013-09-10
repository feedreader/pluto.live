

class Planet < Sinatra::Base
  
  def self.root
    File.expand_path(File.dirname(__FILE__))
  end

  set :public_folder, "#{Planet.root}/public"       # set up the static dir (with images/js/css inside)   
  set :views,         "#{Planet.root}/templates"    # set up the views dir

  set :static, true   # set up static file routing


  #######################
  # Models
  
  include Pluto::Models   # e.g. Feed, Item, Site, etc.


  ##############################################
  # Controllers / Routing / Request Handlers

  get '/' do
    erb :index, locals: { site: site_config_hash }
  end


  #################
  # Utilities 

  def site_config_hash
    h = {}
    site = Site.first      # FIX: for now assume one planet per DB (fix later; allow planet key or similar)
    if site.present?
      h['title']  = site.title
    else
      h['title']  = 'Planet Untitled'
    end
  end


end # class Planet
