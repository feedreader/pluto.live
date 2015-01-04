# encoding: utf-8

class PlanetController < ApplicationController

  # GET '/'                  or
  # GET '/?style=:style'     or
  # GET '/:key?style=:style'
  def index
    key   = params[:key] 
    style = params[:style]

    puts "[planet#index] GET |  key: >#{key}<, style: >#{style}<"

    # make sure style params always gets shown in browser address box
    #  -- helps w/ bookmarking and hopefully avoids confusion w/ users
    # -- add ?style='random' - to make it clear style is random for user
    if style.nil?
      if key.nil?
        redirect_to root_url( style: 'random' )
      else
        redirect_to planet_url( key: key, style: 'random' )
      end
      return  ## Note: lets return - no more processing required/needed
    end

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
      style_lottery = ['std','cards','news','top','hacker','digest', 'paper', 'forty']
      style = style_lottery[ rand( style_lottery.size ) ]
    end

      if ['cards','c','ii','2'].include?( style )
        tmpl    = :'blank.cards'
      elsif ['news','n','iii','3'].include?( style )
        tmpl    = :'news'
      elsif ['top','t','iv','4'].include?( style )
        tmpl    = :'top'
      elsif ['hacker','h','v','5'].include?( style )
        tmpl    = :'hacker'
      elsif ['digest','d','vi','6'].include?( style )
        tmpl    = :'digest'
      elsif ['paper','p','vii','7'].include?( style )
        tmpl    = :'paper'
      elsif ['forty','f','viii','8'].include?( style )
        tmpl    = :'forty'
      else   ### if ['blank','std','b','1','i'].include?( style )
        tmpl    = :'blank'
      end

      ## render :plain => "hello planet - key: #{key}, style: #{style} - #{site.title}"
      ## render :plain => PlanetRenderer.new( tpl ).render( site )

      ## Note: add mark string as safe html (use #html_safe)
      render :html => PlanetRenderer.new( tmpl ).render( site ).html_safe

  end  # method index


end # class PlanetController




class PlanetRenderer

  #######################
  # Models
  
  include Pluto::Models   # e.g. Feed, Item, Site, etc.

  ###################
  # Helpers

  include TextUtils::HypertextHelper
  include TextUtils::DateHelper


  def initialize( style )
    @style = style
  end

  def erb( name )
    ## "<div><b>todo/fix: add partial #{name}</b></div>"

    tmpl = File.read( "#{Rails.root}/app/planets/#{name}.erb" )
    ERB.new(tmpl).result(binding)   ## todo: check - do we need to change output buffer in nested erb call??
  end

  def render( site )
    ## was in sinatra ->  erb tpl, :layout => layout, locals: { site: site }

    tmpl        = File.read( "#{Rails.root}/app/planets/#{@style}.erb" )
    layout_tmpl = File.read( "#{Rails.root}/app/planets/#{@style}_layout.erb" )
    
    ## replace <%= yield %> w/ <%= content %>
    layout_tmpl = layout_tmpl.gsub( /<%=\s*yield\s*%>/, '<%= content %>' )

    content = ERB.new(tmpl).result(binding)
    ERB.new(layout_tmpl).result(binding)
  end

end # class PlanetRenderer


