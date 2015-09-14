#require './users/v1/endpoint' 
#require './users/v2/endpoint'

#require_relative './lib/services/v1/endpoint' # doesn't require authentication 

require_relative './lib/users/v1/endpoint' 
# Users Endpoint must come first as it is the one that controls the authentication code.
# $Utter.use rack md5 digest middleware for authentication, once loaded it forces all endpoints to be authenticated, so anything loaded after it should require autehnciation and anything before it will not requrie authentication.
require_relative './lib/services/v1/endpoint' # require authentication 


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
