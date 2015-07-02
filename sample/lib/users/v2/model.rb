#require 'mongoid'
# require 'utter/redis' 
# this require manipulates the Utter::Model class metaprogramatically so it is ready for the app to use just by requiring. 

module Users 

  module V2

    class User < Utter::Model
      attr_accessor :name
      attr_accessor :password
    end

  end
end
