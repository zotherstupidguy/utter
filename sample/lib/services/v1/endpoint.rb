require_relative './../../../../lib/utter'
require_relative './model'

module Services 
  module V1

   class Endpoint < Utter::Endpoint 

      namespace :services
      prefix    :api
      version   :v1

      get '/ping' do 
	"pong"
      end

      get '/' do 
	Service.all.to_json
      end

      # Usage:
      # curl http://localhost:9393/hi?user=nono
      get '/hi' do 
	{hello: params['user']}.to_json
      end

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
