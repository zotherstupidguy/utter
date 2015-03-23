# No code is faster than no code.
#What makes Redis different from other key-value stores is that it provides other operations similar to INCR that can be used to model complex problems. This is why you can use Redis to write whole web applications without using another database like an SQL database, and without going crazy.
# Redis values can be more than strings. Redis supports Lists, Sets, Hashes, Sorted Sets, Bitmaps, and HyperLogLog types as values, and there are atomic operations to operate on them so we are safe even with multiple accesses to the same key. 


# lpush users someusername # now i have a list of all users registered
# hset users:someusername "marsheledobject for presistance" #now i have a hash of every registered user 

require "redis"
require "json"

module Utter

  class Model
    attr_reader :id

    def self.inherited utter_model
      p "#Utter::Model: #{utter_model.to_s} initialized"
    end

    def self.store
      puts "#{self.to_s.downcase + "s"} are stored in host: #{@host}, port: #{@port}"
      Redis.new(:host => @host, :port => @port) 
      #Redis.auth password
      #Redis.new(:host => '127.0.0.1', :port => '4567')
      #Redis.new(:host => '127.0.0.1', :port => '4567', :password => 'Utter_$t0re')
    end

    def id
      #@id = self.class.store.incr(self.class.to_s.downcase + ":uid")
    end

    def save 
      model = (self.class.to_s.downcase + 's') 
      self.class.store.set "#{model + ":" + @id}", Marshal::dump(self)
      #model_list = (self.class.to_s.downcase + 's') 
      #ids  = self.class.store.lrange(self.class.to_s.downcase + "s", 0, -1)
      #self.class.store.mget(*ids.map {|u| "#{self.class.to_s.downcase + 's'}:#{u}"})

      # lpush model_list @id                               # now i have a list of all users registered
      # hset "#{model_list}:#{@id}" Marshal::dump(self)    #"marsheledobject for presistance" #now i have a hash of every registered user 



      #self.class.store.mget(*ids.map {|u| "#{self.class.to_s.downcase + 's'}:#{u}"})

=begin
      #self.class.store.rpush(self.class.to_s.downcase + "s",  Marshal::dump(self))
      if !self.class.store.hget(self.class.to_s.downcase + "s",  @id)
	self.class.store.hset(self.class.to_s.downcase + "s",  @id, Marshal::dump(self))
	#self.class.store.sadd(self.class.to_s.downcase + "s", Marshal::dump(self))
      else
	p "obj already exists"
      end
=end
    end

    def update
    end

    def self.find id
      # perform a sanity check in the model_list then  if exists mget to and Marshal:load to get the presisted object back

      #Marshal::load(store.hget(class.to_s.downcase + "s",  id))
      #p self.to_s.downcase
      #Marshal::load(store.hget(self.to_s.downcase + "s",  id))
      model = (self.class.to_s.downcase + 's') 
      p (store.get "#{model + ":" + id}") 
      Marshal::load(store.get "#{model + ":" + id}") 
    end

    def range 
      #self.class.store.getset(self.class.to_s.downcase + "s")
      #self.class.store.lrange(self.class.to_s.downcase + "s", -15, -1).reverse
      p "#############################"
      p "finding... " + self.class.to_s.downcase + "s"
      #p self.class.store.lrange(self.class.to_s.downcase + "s", -15, -1).reverse
      self.class.store.lrange(self.class.to_s.downcase + "s", 0, -1).each do |user|
	my =	 Marshal::load(user)
	"*****"
	p my.id
      end
      p "#############################"
      #self.class.store.getset(self.class.to_s.downcase + "s", self.class.to_s.downcase + ":uid")
    end

    def index id 
      self.class.store.lindex(self.class.to_s.downcase + "s", id)
    end

    def self.all
      store.smembers(self.to_s.downcase + "s")
    end

    def flush!
      # delete all
    end
    def self.index value
      @id = value
    end
  end

end

class User < Utter::Model
  #db('127.0.0.1', '3434')
  attr_accessor :username, :password

  #index @username 
  def username= id  
    @id = id 
    @username = id
  end
end

class Idea < Utter::Model
  #db('127.0.0.1', '3434')
end

user = User.new
user.username = "kkiko"
user.password = "downhilligo"
p user.id
p user.save
#user.range # takes first_index, last_index 
#p user.id
#p user.index 50 

current_user = User.find "kkiko"
p current_user.username
p current_user.password
#p User.all
#idea = Idea.new
#p "Idea id is"
##p idea.id
