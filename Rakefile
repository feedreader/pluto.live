

task :env  do
  require './boot'
  
  LogUtils::Logger.root.level = :debug
end


desc 'pluto - show planet (feed) stats'
task :stats => :env do
  puts "stats:"
  puts "  Feeds:  #{Pluto::Models::Feed.count}"
  puts "  Items:  #{Pluto::Models::Item.count}"
end


### fix/todo: move planet key out rakefile
PLANET_KEY  = 'ruby'
INSTALL_DIR = File.expand_path( File.dirname(__FILE__))

PLANET_CONFIG = "#{INSTALL_DIR}/#{PLANET_KEY}.yml"


desc 'pluto - update planet (feeds)'
task :update => :env do
  
  opts = Pluto::Opts.new
  
  config = YAML.load_file( PLANET_CONFIG )
      
  puts "dump >#{PLANET_CONFIG}<:"
  pp config

  Pluto::Fetcher.new( opts, config ).run
  
  puts 'Done.'
end

