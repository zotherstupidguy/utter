require 'utter'

class UserAPI < Utter::Base

  namespace :user

  get '/' do 
    {hello: "user"}.to_json
  end

  get '/user/hi' do 
    #http://localhost:9393/hi?user=nono
    {hello: params['user']}.to_json
  end
end

class CargoAPI < Utter::Base
  namespace :cargo 

  get '/' do 
    {hello: "cargo"}.to_json
  end

end
