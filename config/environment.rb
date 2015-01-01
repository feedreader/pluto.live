# Load the Rails application.
require File.expand_path('../application', __FILE__)


############
## todo/fix:  check why is this still required?? is now an extra gem ??
# pluto admin server app
require 'pluto/admin/server'


# Initialize the Rails application.
Rails.application.initialize!
