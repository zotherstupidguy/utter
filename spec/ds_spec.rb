require './../lib/utter'
require './helper'

describe Utter::Model do
  it "contains a instance #save method" do 
  end
  it "contains a class #find method" do 
  end
  it "contains a class #exists? method" do 
  end
end

describe "User < Utter::Model" do
  before do 
  end
  it "saves an object" do 
  end
  it "finds an object" do 
  end
  it "checks if object exists?" do 
  end
end

class User < Utter::Model
  #db('127.0.0.1', '3434')
  attr_accessor :username, :password
  index :username 
end

class Idea < Utter::Model
  #db('127.0.0.1', '3434')
  attr_accessor :title, :url
  index :title 
end

user = User.new
user.username = "kkiko"
user.password = "downhilligo"
user.save
p User.all

#user.range # takes first_index, last_index 
#p user.id
#p user.index 50 

user = User.new
user.username = "fouad"
user.save
current_user = User.find "fouad"
p current_user.username
#p User.all
#idea = Idea.new
#p "Idea id is"
##p idea.id
#p User.all

#i = Idea.new
#i.title = "phd"
#i.id = "phd"
#i.save

#p Idea.all
#myi = Idea.find "phd"
#p Idea.exists? "pshd"
