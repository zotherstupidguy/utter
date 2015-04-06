require_relative './../helper'

class Endpoint < Utter::Endpoint 

  prefix    :api
  version   :v1
  namespace :test

  get '/ping' do 
    "pong"
  end

end
