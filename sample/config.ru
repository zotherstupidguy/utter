#require './users/v1/endpoint' 
#require './users/v2/endpoint'

require './lib/services/v1/endpoint'
#require './statuses/v1/endpoint' 

# Uncomment this if you want to use MongoDB
# This configures our mongodb using mongoid gem
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
