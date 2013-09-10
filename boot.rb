ENV['RACK_ENV'] ||= 'development'

require 'bundler'

puts "ENV['RACK_ENV'] = #{ENV['RACK_ENV']}"

Bundler.setup
Bundler.require(:default, ENV['RACK_ENV'].to_sym)


# load server   (before connect? - include in boot.rb - why not?? )

require 'pluto/server'


#######
# todo - move boot.rb  to config/boot.rb - why? why not?

