require 'utter'
require_relative './model'

#Long random string.  Use a better one than this.                              
#opaque = "1234567890"

#$Utter.use Rack::Auth::Digest::MD5, "Hello, World", opaque do |username|
#  'secret'
#end

#require 'rack/ssl'
#
#$Utter.use Rack::SSL
#
#$Utter.use Rack::Digest::MD5.new(app) do |username, password|
#  username == "foo" && password == "bar"
#end

module Users 
  module V1

    # An Endpoint component defines the particulars of a specific endpoint at which a given service is available.
    # Web services expose one or more endpoints to which messages can be sent. 
    # A web service endpoint is an entity, processor, or resource that can be referenced and to which web services messages can be addressed. 
    # Endpoint references convey the information needed to address a web service endpoint. 
    # Clients need to know this information before they can access a service.
    #Typically, web services package endpoint descriptions and use a WSDL file to share these descriptions with clients.
    #Clients use the web service endpoint description to generate code that can send SOAP messages to and receive SOAP messages from the web service endpoint.

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
=begin
	if Users::V1::User.where(username: params[:username]).exists?
	  user = Users::V1::User.find_by(username: params[:username])
	  if user.password ==  params[:password]
	    @user = user
	    'success'
	  else
	    @user = nil
	  end
	else 
	  'failure!'
	end
=end
      end
      get '/info' do 
	env
      end

      post '/signup' do 
	signup params[:username], params[:password]
=begin
	u = Users::V1::User.new
	u.username     = params[:username] 
	u.password = params[:password]

	if !Users::V1::User.where(username: params[:username]).exists?
	  u.save!
	  'success!'
	else 
	  'failure!'
	end
=end
      end

    end
  end
end
