require './boot'


###
# todo: move tasks to gem and just include Pluto.load_tasks or similar here


task :env  do
  LogUtils::Logger.root.level = :debug

  Pluto.connect!
end

desc 'pluto - debug site setup'
task :site => :env do
  site = Pluto::Models::Site.first      # FIX: for now assume one planet per DB (fix later; allow planet key or similar)
  if site.present?
    puts "site found:"
    pp site
  else
    puts "no site found"
  end
end


desc 'pluto - show planet (feed) stats'
task :stats => :env do
  puts "stats:"
  puts "  Feeds: #{Pluto::Models::Feed.count}"
  puts "  Items: #{Pluto::Models::Item.count}"
  puts "  Sites: #{Pluto::Models::Site.count}"
  puts "  Subscriptions:  #{Pluto::Models::Subscription.count}"
end


desc 'pluto -=- setup/update feed subscriptions'
task :setup => :env do

  ## check if PLANET key passed in
  if ENV['PLANET'].present?
    key = ENV['PLANET']
    puts "setup planet for key >#{key}<"
  else
    puts 'no PLANET=key passed along; try defaults'
    # try pluto.yml or planet.yml if exist

    if File.exists?( './pluto.ini' ) || File.exists?( './pluto.yml' ) # check if pluto.yml exists, if yes add/use it
      key ='pluto'
    elsif File.exists?( './planet.ini' ) || File.exists?( './planet.yml' ) # check if planet.yml exists, if yes add/use it
      key = 'planet'
    else
      puts '*** note: no arg passed in; no pluto.ini|yml or planet.ini|yml found in working folder'
    end
  end


  config_path = "./#{key}.ini"
  if File.exists?( config_path )
    config = INI.load_file( config_path )
  else  ## assume .yml
    config_path = "./#{key}.yml"
    config = YAML.load_file( config_path )
  end
  

  puts "dump planet setup settings >#{config_path}<:"
  pp config

  # note: allow multiple planets (sites) for a single install
  Pluto::Subscriber.new.update_subscriptions_for( key, config )

  puts 'Done.'
end


desc 'pluto -=- update planet (feeds)'
task :update => :env do

  Pluto.update_feeds
  
  puts 'Done.'
end
