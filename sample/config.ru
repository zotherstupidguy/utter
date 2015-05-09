#require './users/v1/endpoint' #TODO replace with #require 'project_name/users'    #gem
#require './users/v2/endpoint'

require './services/v1/endpoint'
#require './statuses/v1/endpoint' #TODO replace with #require 'project_name/statuses' #gem

# lets configure our mongodb using mongoid gem
#Mongoid.load!("./mongoid.yml")
=begin
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    # location of your API
    resource '/api/v1/services/*', :headers => "Access-Control-Allow-Origin", :methods => [:get, :post, :options, :put]
  end
end
=end
run Utter::Endpoints
