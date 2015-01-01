
class Planet < Sinatra::Base

  #######################
  # Models
  
  include Pluto::Models   # e.g. Feed, Item, Site, etc.

  ###################
  # Helpers

  include TextUtils::HypertextHelper
  include TextUtils::DateHelper

  def path_prefix
    request.script_name # request.env['SCRIPT_NAME']
  end

  ##############################################
  # Controllers / Routing / Request Handlers

  get '/favicon.ico' do
    404  # return 404 not found - sorry - no favicon.ico - we use favicon.png
  end


  get '/:key?' do

    key   = params[:key] 
    style = params[:style]

    puts "  get /:key?  |  key: >#{key}<, style: >#{style}<"

    # make sure style params always gets shown in browser address box
    #  -- helps w/ bookmarking and hopefully avoids confusion w/ users
    # -- add ?style='random' - to make it clear style is random for user
    if style.nil?
      if key.nil?
        redirect "#{path_prefix}/?style=random"  # default style is random
      else
        redirect "#{path_prefix}/#{key}?style=random"  # default style is random        
      end
    else

      if key
        site = Site.find_by_key!( key )
      else
        # note: use order(:id) to make sure site pos(ition) will not get changed by db updates
        site = Site.order(:id).first
        key  = site.key
      end

      if ['random', 'rnd', 'r', 'lucky', 'luck', 'shuffle' ].include?( style )
        # random style - throw the dice for surprise
        # note: zero based e.g. 0,1,2,3,4,5 for array inden
        style_lottery = ['std','cards','news','top','hacker','digest']
        style = style_lottery[ rand( style_lottery.size ) ]
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
      
      erb tpl, :layout => layout, locals: { site: site }
    end
  end # get '/:key?'


end # class Planet
