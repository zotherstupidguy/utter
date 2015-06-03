#require './users/v1/endpoint' 
#require './users/v2/endpoint'

require './lib/services/v1/endpoint'

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
