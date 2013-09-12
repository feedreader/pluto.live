require './boot'


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


desc 'pluto - ruby.yml -=- setup/update feed subscriptions'
task :setup_ruby => :env do

  require './ruby.seeds'

  puts 'Done.'
end


desc 'pluto - viennarb.yml -=- setup/update feed subscriptions'
task :setup_viennarb => :env do

  require './viennarb.seeds'

  puts 'Done.'
end


desc 'pluto - update planet (feeds)'
task :update => :env do

  Pluto.update_feeds
  
  puts 'Done.'
end
