require_relative './../helper'

class User < Utter::Model
  #db('127.0.0.1', '3434')
  attr_accessor :username, :password
  index :username 
end


describe Utter::Model do
  it "contains a instance #save method" do 
    skip
  end
  it "contains a class #find method" do 
    skip
  end
  it "contains a class #exists? method" do 
    skip
  end
end

describe "User < Utter::Model" do

  describe "saving" do 
    before do 
      #system("sudo service redis-server restart")
      system("redis-cli flushall")
    end
    it "saves an objects" do 
      user = User.new
      user.username = "usera"
      user.password = "passwordusera"
      user.save

      user = User.new
      user.username = "userb"
      user.password = "passworduserb"
      user.save

      User.all.must_equal ["userb", "usera"]
    end
  end

  describe "finding" do 
    before do 
      system("redis-cli flushall")
      user = User.new
      user.username = "userx"
      user.password = "passworduserx"
      user.save
    end
    it "finds an object and updates it" do 
      current_user = User.find "userx"
      current_user.password = "updatedpass"
      current_user.save

      User.find("userx").password.must_equal "updatedpass"
    end
  end

  describe "existance" do 
    before do 
      system("redis-cli flushall")
      user = User.new
      user.username = "usera"
      user.password = "passworduserx"
      user.save
    end
    it "checks if object exists?" do 
      User.exists?("usera").must_equal true
      User.exists?("userG").must_equal false 
    end
  end

end
