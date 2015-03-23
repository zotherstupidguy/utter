
#> utter setup server
# http://ruby-doc.org/stdlib-2.0.0/libdoc/rubygems/rdoc/Gem/Server.html

require 'rubygems/server'

gem_server = Gem::Server.new Gem.dir, 8089, false
gem_server.run
