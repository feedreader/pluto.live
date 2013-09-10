ENV['RACK_ENV'] ||= 'development'

require 'bundler'

puts "ENV['RACK_ENV'] = #{ENV['RACK_ENV']}"

Bundler.setup
Bundler.require(:default, ENV['RACK_ENV'].to_sym)


# 3rd party libs/gems

require 'sinatra/base'    # todo/checkfix  - move to Gemfile  use gem sinatra w/-> require or similar

# planet app

require './planet'

#######
# todo - move boot.rb  to config/boot.rb - why? why not?

