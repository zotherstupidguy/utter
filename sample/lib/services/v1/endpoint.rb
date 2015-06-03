require_relative './../../../../lib/utter'
require_relative './model'

module Services 
  module V1
   class Endpoint < Utter::Endpoint 

      prefix    :api
      version   :v1
      namespace :services

      get '/ping' do 
	"pong"
	#log.info "a ping gets a pong"
      end

      get '/' do 
	Service.all.to_json
      end

      # Usage:
      # curl http://localhost:9393/hi?user=nono
      get '/hi' do 
	if params['user'].given?
	  {hello: params['user']}.to_json
	else 
	  "hi there"
	end
      end

      # Usage:
      # curl http://localhost:9393/new?title="some title"
      post '/new' do
	s = Service.new 
	s.title = params['title']
	s.price = '222'
	s.save
	"ok".to_json
      end

    end
  end
end
