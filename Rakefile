require './boot'


task :env  do
  LogUtils::Logger.root.level = :debug

  Pluto.connect!
end


desc 'pluto - show planet (feed) stats'
task :stats => :env do
  puts "stats:"
  puts "  Feeds: #{Pluto::Models::Feed.count}"
  puts "  Items: #{Pluto::Models::Item.count}"
  puts "  Sites: #{Pluto::Models::Site.count}"
  puts "  Subscriptions:  #{Pluto::Models::Subscription.count}"
end


desc 'pluto - setup/update feed subscriptions'
task :setup => :env do

  require './seeds'

  puts 'Done.'
end


desc 'pluto - update planet (feeds)'
task :update => :env do

  Pluto.update_feeds
  
  puts 'Done.'
end
