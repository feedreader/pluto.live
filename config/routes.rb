

Rails.application.routes.draw do

  mount About::Server,      at: '/sys'
  mount DbBrowser::Server,  at: '/browse'

  mount PlutoAdmin::Server, at: '/db'   ## note: requires => require 'pluto/admin/server'


  resources :sites  # for debugging/browsing sites in rails

  get '/:key' => 'planet#index', as: 'planet'
  root 'planet#index'

end

