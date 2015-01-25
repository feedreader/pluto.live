# encoding: utf-8

class TimelineController < ApplicationController

  def index
    ## Note: add mark string as safe html (use #html_safe)
    render :html => TimelineRenderer.new.render.html_safe
  end

end  # class TimelineController


class TimelineRenderer
  #######################
  # Models
  
  include Pluto::Models   # e.g. Feed, Item, Site, etc.

  ###################
  # Helpers

  include TextUtils::HypertextHelper
  include TextUtils::DateHelper

  def render
    tmpl = File.read( "#{Rails.root}/app/views/timeline/index.html.erb" )
    ERB.new(tmpl).result(binding)
  end

end # class TimelineRenderer

