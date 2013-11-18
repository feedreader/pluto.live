

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

  get '/favicon.ico' do
    404  # return 404 not found - sorry - no favicon.ico - we use favicon.png
  end


  get '/' do
    # add ?style='random' - to make it clear style is random for user
    #  plus add key of first planet
    key = Site.first.key
    style = params[:style] || 'random'   # default style is random
    redirect "#{path_prefix}/#{key}?style=#{style}"
  end


  get '/:key?' do
    key   = params[:key]

    puts "  get /:key?  |  key: >#{key}<"

    key = Site.first.key    if key.nil?

    ### todo/fix: if no style present - how can i (best) redirect to add ?style=
    # to browser url?? - use sinatra constraints??? check it
    # to avoid confusion - always show/include ?style=<theme>

    style = params[:style] || 'random'   # default style is random

    if ['random', 'rnd', 'r', 'lucky', 'luck', 'shuffle' ].include?( style )
      # random style - throw the dice for surprise
      # note: zero based e.g. 0,1,2,3,4,5 for array inden
      style = ['std','cards','news','top','hacker','digest'][ rand(6) ]
    end

    if ['cards','c','ii','2'].include?( style )
      tpl    = :'blank.cards'
      layout = :'blank.cards_layout'
    elsif ['news','n','iii','3'].include?( style )
      tpl    = :'news'
      layout = :'news_layout'
    elsif ['top','t','iv','4'].include?( style )
      tpl    = :'top'
      layout = :'top_layout'
    elsif ['hacker','h','v','5'].include?( style )
      tpl    = :'hacker'
      layout = :'hacker_layout'    
    elsif ['digest','d','vi','6'].include?( style )
      tpl    = :'digest'
      layout = :'digest_layout'
    else   ### if ['blank','std','b','1','i'].include?( style )
      tpl    = :'blank'
      layout = :'blank_layout'
    end

    erb tpl, :layout => layout, locals: { site: Site.find_by_key!( key ) }
  end


end # class Planet
