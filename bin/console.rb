# If there is a problem you can’t solve, 
# then there is an easier problem you can solve: find it. 
# 					~ “How To Solve It,” G. Pólya, 1945

require './util'
require 'rake'

app = Rake.application
app.init
# do this as many times as needed
#app.add_import 'konsole'
# this loads the Rakefile and other imports
app.load_rakefile

app['new'].invoke model = "Users", ver="v1"

puts "hello"
puts $WARN
