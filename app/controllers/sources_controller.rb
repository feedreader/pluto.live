# encoding: utf-8

class SourcesController < ApplicationController

  def index
  end


  def opml
    key = params[:key]
    if key == 'all'
      @site_title = 'All'
      @feeds      = Feed.order(:title)
    else
      site  = Site.find_by_key!( key )

      @site_title  = site.title
      @feeds       = site.feeds.order(:title)
    end

    render action: 'opml.xml.builder',
           content_type: 'application/xml',    ## what content type to use???
           layout: false
  end


end  # class SourcesController

