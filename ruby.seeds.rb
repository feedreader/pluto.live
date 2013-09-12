######################
# Note:
#  use   rake setup_ruby    - to call/run/load planet config


# load (setup) planet config

PLANET_CONFIG = './ruby.yml'

config = YAML.load_file( PLANET_CONFIG )
      
puts "dump planet setup settings >#{PLANET_CONFIG}<:"
pp config

Pluto.update_subscriptions( config )
