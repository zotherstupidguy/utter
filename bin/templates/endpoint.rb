require 'utter'
require_relative './model'

module Users 
  module V1

    class Endpoint < Utter::Endpoint 

      prefix    :api
      version   :v1
      namespace :users

      get '/' do 
	User.all.to_json
      end

      get '/hi' do 
	#http://localhost:9393/hi?user=nono
	{hello: params['user']}.to_json
      end

      get '/profile' do
	auth params[:username], params[:password]
	current_user.to_json
	(status 'unav').to_json
      end

      post '/login' do
	auth params[:username], params[:password]
	current_user.username
      end
      get '/info' do 
	env
      end

      post '/signup' do 
	signup params[:username], params[:password]
      end

    end
  end
end
