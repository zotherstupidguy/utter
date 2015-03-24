# require 'utter/redis' 
# this require manipulates the Utter::Model class metaprogramatically so it is ready for the app to use just by requiring. 

module Utter

  module SimpleAuth 
    class User < Utter::Model  
      attr_accessor :username, :password
      index :username
    end

    @user = nil

    def current_user
      @user
    end

    # Usage
    #
    # post '/signup' do 
    #	signup params[:username], params[:password]
    # end
    def signup username, password
      u = Utter::SimpleAuth::User.new
      u.username = username 
      u.password = password

      if !Utter::SimpleAuth::User.exists? username
	u.save!
	@user = Utter::SimpleAuth::User.find(username)
	'success!'
      else 
	'Username already exists!'
      end
    end

    # Usage
    # post '/login' do
    # 	auth params[:username], params[:password]
    # 	current_user.username
    # end
    def auth username, password
      #if Users::V1::User.where(username: username).exists?
      if Utter::SimpleAuth::User.exists?(username)
	user = Utter::SimpleAuth::User.find(username)
	if user.password ==  password
	  @user = user
	  'success: return user session token to the client app which expires in 24hours'
	else
	  @user = nil
	  'failure!'
	end
      else 
	@user = nil
	'failure!'
      end
    end
  end
  helpers SimpleAuth 
end

# Usage in the Application
=begin

module Users 
  module V1
    class User < Utter::SimpleAuth::User
    end
  end
end

=end
