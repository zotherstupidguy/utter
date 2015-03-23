# No code is faster than no code.
require "pstore"

module Utter

  class DB
    #attr_accessor :name, :host, :port, :password
    #def initialize name = 'pstore', host = '127.0.0.1', port = '4567', password = 'Utter_$t0re'
    def initialize name 
      @db = PStore.new(name)
    end

    def save obj 
      @db.transaction do 
	data = Marshal.dump(obj)
      end
    end

    def get id
      @db[id]
      obj = Marshal.load(data)
    end
    #o = Klass.new("hello\n")
    #data = Marshal.dump(o)
    #obj = Marshal.load(data)
    #obj.say_hello  #=> "hello\
  end

  class Model

    def self.inherited utter_model
      p "#Utter::Model: #{utter_model.to_s} initialized"
      @@store = DB.new(utter_model.to_s)
    end

    def id

    end

    def get exp
      @@store[exp.sym]
    end

    def save
      @@store.save self
    end

    def all
    end

    def find exp
    end

    def flush!
      # delete all
    end

  end

end
