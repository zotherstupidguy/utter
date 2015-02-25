require './api.rb'
map '/x' do 
  use Rack::CommonLogger  
  use Rack::Session::Cookie; # https://gist.github.com/noahhendrix/1509698 Authenticating with Grape
  use Rack::Lock; # simultanious requests

  run Utter::API 
end

#app = Rack::URLMap.new "/one" => MyAPI 
#run app

#MyAPI.new.run

=begin
map "/" do
  use Rack::CommonLogger  
  run App 
end


#http://nereida.deioc.ull.es/~plgrado/javascriptexamples/node121.html
app1 = lambda { |e| [200, {}, ["one\n"]]}
app2 = lambda { |e| [200, {}, ["two\n"]]}
app3 = lambda { |e| [200, {}, ["one + two = three\n"]]}

app = Rack::URLMap.new "/one" => app1, "/two" => app2, "/one/two" => app3

run app
=end

=begin
# infinity.ru

infinity = Proc.new {|env| [200, {"Content-Type" => "text/html"}, env.inspect]}

use Rack::CommonLogger

map '/' do
  run infinity
end

map '/version' do
  map '/' do
    run Proc.new {|env| [200, {"Content-Type" => "text/html"}, "infinity 0.1"] }
  end

  map '/last' do
    run Proc.new {|env| [200, {"Content-Type" => "text/html"}, "infinity beta 0.0"] }
  end
end
=end
