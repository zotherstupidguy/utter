# require 'utter/redis' 
# this require manipulates the Utter::Model class metaprogramatically so it is ready for the app to use just by requiring. 

# MongoDB Utter Extension, packaged as a gem
require 'mongoid'

module Utter

  class Model
    include Mongoid::Document
  end

  module Mongo
    @user = nil
    class User < Utter::Model  
      field :username
      field :password
      index({ username: 1 }, { unique: true })
    end

    def auth username, password
      #if Users::V1::User.where(username: username).exists?
      if Utter::Mongo::User.where(username: username).exists?
	user = Utter::Mongo::User.find_by(username: username)
	#user = Users::V1::User.find_by(username: username)
	if user.password ==  password
	  @user = user
	  'success: return user session token to the client app which expires in 24hours'
	else
	  @user = nil
	end
      else 
	@user = nil
	'failure!'
      end
    end

    def signup username, password
	u = Users::V1::User.new
	u.username     = params[:username] 
	u.password = params[:password]

	if !Users::V1::User.where(username: params[:username]).exists?
	  u.save!
	  @user = Utter::Mongo::User.find_by(username: username)
	  'success!'
	else 
	  'failure!'
	end
    end

    def current_user
      @user
    end
  end
  module HTTP
    def status title
      status = { unav: 404, success: 200 }
      status[title.to_sym]
    end
  end
  helpers Mongo 
  helpers HTTP 
end


module Users 

  module V1
    
    class User < Utter::Mongo::User
    end

  end
end
