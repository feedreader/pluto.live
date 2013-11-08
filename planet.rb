

class Planet < Sinatra::Base

  #######################
  # Models
  
  include Pluto::Models   # e.g. Feed, Item, Site, etc.

  ###################
  # Helpers

  include TextUtils::HypertextHelper
  include TextUtils::DateHelper

  def path_prefix
    request.script_name   # request.env['SCRIPT_NAME']
  end

  def site_path( site, opts={} )
    ## fix: reuse opts to attribs func
    if opts.empty?
      "#{path_prefix}/#{site.key}"
    else
      buf = "#{path_prefix}/#{site.key}?"
      opts.each_with_index do |(key, value), index|
        buf << '&' if index > 0
        buf << "#{key}=#{value}"
      end
      buf
    end
  end

  def root_path( opts={} )
    # note: convert opts to query params e.g ?style=iii

    if opts.empty?
      "#{path_prefix}/"
    else
      buf = "#{path_prefix}/?"
      opts.each_with_index do |(key, value), index|
        buf << '&' if index > 0
        buf << "#{key}=#{value}"
      end
      buf
    end
  end

  ##############################################
  # Controllers / Routing / Request Handlers

  get '/:key?' do
    key   = params[:key]
    
    puts "  get /:key?  |  key: >#{key}<"
    
    key = Site.first.key    if key.nil?
    
    style = params[:style] || 'std'
    if ['cards','c','ii','2'].include?( style )
      tpl    = :'blank.cards'
      layout = :'blank.cards_layout'
    elsif ['news','n','iii','3'].include?( style )
      tpl    = :'news'
      layout = :'news_layout'
    elsif ['top','t','iv','4'].include?( style )
      tpl    = :'top'
      layout = :'top_layout'
    else
      tpl    = :'blank'
      layout = :'blank_layout'
    end

    erb tpl, :layout => layout, locals: { site: find_site_by_key( key ) }
  end


  get '/blank' do
    erb :blank, :layout => :blank_layout, locals: { site: find_site_first }
  end

  get '/blank.cards' do
    erb :'blank.cards', :layout => :'blank.cards_layout', locals: { site: find_site_first }
  end

  #################
  # Utilities

  def find_site_by_key( key )
    Site.find_by_key!( key )
  end

  def find_site_first
    site = Site.first      # FIX: for now assume one planet per DB (fix later; allow planet key or similar)
    if site.present?
      site
    else
      site = Site.new
      site.title = 'Planet Untitled'
    end
  end


end # class Planet
