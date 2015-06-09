# No code is faster than no code.
#
# What makes Redis different from other key-value stores is that it provides other operations similar to INCR that can be used to model complex problems. 
# This is why you can use Redis to write whole web applications without using another database like an SQL database, and without going crazy.
# Redis values can be more than strings.Redis supports Lists, Sets, Hashes, Sorted Sets, Bitmaps, and HyperLogLog types as values, 
# and there are atomic operations to operate on them so we are safe even with multiple accesses to the same key. 


# lpush users someusername # now i have a list of all users registered
# set users:someusername "marsheledobject for presistance" #now i have a hash of every registered user 

require "redis"

module Utter

  class Model < Utter::Klass

    attr_accessor :id

    def self.inherited utter_model
      log.info "#Utter::Model: #{utter_model.to_s} initialized"
    end

    def self.store
      Redis.new(:host => @host, :port => @port) 
    end

    def save 
      if !self.class.exists? @id
	Utter::Klass.log.info "saving #{@id}"
	model = (self.class.to_s.downcase + 's') 
	self.class.store.lpush model, @id # now i have a list of all users registered
	self.class.store.set "#{model + ":" + @id}", Marshal::dump(self)
      else 
	Utter::Klass.log.info "#{id} already exists, updating"
	model = (self.class.to_s.downcase + 's') 
	self.class.store.set "#{model + ":" + @id}", Marshal::dump(self)
      end
    end

    def self.find id
      if exists? id
	model = (self.to_s.downcase + 's') 
	Marshal::load(store.get "#{model + ":" + id}") 
      else
	log.info "#{id} not found"
      end
    end

    def self.all
      store.lrange(self.to_s.downcase + "s", 0, -1)
    end

    def self.index( name )
      alias_method name, :id
      alias_method "#{name}=".to_sym, :id=
    end

    def self.exists? id 
      if store.lrange(self.to_s.downcase + "s", 0, -1).include? id
	return true
      else
	return false
      end
    end

    alias :save! :save
  end

end
