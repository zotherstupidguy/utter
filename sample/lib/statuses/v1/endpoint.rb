require 'utter'
require './model'

module Statuses 

  module V1

    class Endpoint < Utter::Endpoint

      prefix    :api
      version   :v1
      namespace :status

      get '/' do 
	{hello: "statuses"}.to_json
	log.info "hi"
      end

      get '/hi' do 
	#http://localhost:9393/hi?user=nono
	{hello: params['user']}.to_json
      end
    end
  end
end
