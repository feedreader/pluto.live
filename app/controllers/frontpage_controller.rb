# encoding: utf-8

class FrontpageController < ApplicationController

  def index
    ## Note: add mark string as safe html (use #html_safe)
    render :html => FrontpageRenderer.new.render.html_safe
  end

end  # class FrontpageController


class FrontpageRenderer
  #######################
  # Models

  include Pluto::Models   # e.g. Feed, Item, Site, etc.

  ###################
  # Helpers

  include TextUtils::HypertextHelper
  include TextUtils::DateHelper

  def render
    tmpl = File.read( "#{Rails.root}/app/views/frontpage/index.html.erb" )
    ERB.new(tmpl).result(binding)
  end

end # class TimelineRenderer
