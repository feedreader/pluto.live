

class Planet < Sinatra::Base

  #######################
  # Models
  
  include Pluto::Models   # e.g. Feed, Item, Site, etc.


  ##############################################
  # Controllers / Routing / Request Handlers

  get '/' do
    erb :index, locals: { site: find_planet_site }
  end


  #################
  # Utilities

  def find_planet_site
    site = Site.first      # FIX: for now assume one planet per DB (fix later; allow planet key or similar)
    if site.present?
      site
    else
      site = Site.new
      site.title = 'Planet Untitled'
    end
  end


end # class Planet
