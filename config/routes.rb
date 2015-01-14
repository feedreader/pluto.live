

Rails.application.routes.draw do

  mount About::Server,      at: '/sys'
  mount DbBrowser::Server,  at: '/browse'

  mount PlutoAdmin::Server, at: '/db'   ## note: requires => require 'pluto/admin/server'


  ## Note: needs to turn off (magic/builtin optional) (.:format) pattern/match - e.g. use format:false
  #  Note:  dot (.) is a segment separator by default in rails routes
  get '/:key.opml'  => 'sources#opml', format: false, as: 'opml'

  resources :sources
  resources :sites  # for debugging/browsing sites in rails

  get '/:key' => 'planet#index', as: 'planet'
  root 'planet#index'

end

