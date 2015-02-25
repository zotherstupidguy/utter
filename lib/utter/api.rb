=begin
#It's just amazing. No code is faster than no code.
# I want Utter application to be a mountable rack application that gets to utilize Utter's DSL
require 'rack' 
require 'json' 

module Utter
  class Builder
    attr_accessor :rackbuilder, :request
    def initialize 
      @rackbuilder = Rack::Builder.new
      @request = nil

      @rackbuilder.use Rack::Session::Cookie; # https://gist.github.com/noahhendrix/1509698 Authenticating with Grape
      @rackbuilder.use Rack::Lock; # simultanious requests

      before do |e|
	@request = Rack::Request.new e
	@request.params.dup.map do |k,v| 
	  params[k.to_sym] = v
	end
      end
    end    

    def map *args, &block
      @rackbuilder.instance_eval &block
    end

    def before &block
      @rackbuilder.use Rack::Config,&block
    end

  end
end

module Utter
  module DSL 
    extend Rack
    builder = Utter::Builder.new.rackbuilder
    #%w"get head post put delete trace options connect patch resource res namespace ns stream endpoint".each do |method|
    #
    %w{get post put delete}.map do |method|
      define_method(method) do |path, &block|
	builder.map(path) do
	  run ->(e) { [200, {"Content-Type" => "application/json"}, [builder.instance_eval(&block)]] }
	end
      end
    end

    %w[params session].map do |m|
      define_method(m)do 
	q.send m
      end
    end
  end

  class API 
    extend Utter::DSL
  end

end
=end
require 'rack' 
require 'json' 

module Utter
  module DSL
    $builder = Rack::Builder.new
    %w{get post put delete}.map do |method|
      define_method(method) do |path, &block|
	$builder.map(path) do
	  run ->(e) { [200, {"Content-Type" => "application/json"}, [$builder.instance_eval(&block)]] }
	end
      end
    end
  end
  API = $builder
=begin
  class API
    extend Utter::DSL
    def run
      Rack::Handler.get("webrick").run($builder,Port:$port)
    end
  end
#infinity = Proc.new {|env| [200, {"Content-Type" => "text/html"}, env.inspect]}
=end
end

class MyAPI #< Utter::API
  extend Utter::DSL

  get '/dfdfdf' do 
    {hello: "fouad"}.to_json
  end

  get '/hi' do 
    #return [200, {"Content-Type" => "application/json"}, [out]]
    {hello: "hi"}.to_json
  end
end

#Utter::API.map('/') do 
#  run MyAPI 
#end

#Rack::Handler.get("webrick").run($builder,Port:$port)
