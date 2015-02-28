# No code is faster than no code.
require 'rack' 
require 'json' 

module Utter
  class Base 

    $Utter = Rack::Builder.new
    request = nil

    %w[params session].map do |m|
      Object.method(:define_method).(m){request.send m}
    end

    def self.before &b
      $Utter.use Rack::Config, &b
    end

    class << self
      %w{get post put delete}.map do |method|
	define_method(method) do |path, &block|
	  $Utter.map('/' + @namespace.to_s + path) do
	    run lambda { |env| [200, {"Content-Type" => "application/json"}, [$Utter.instance_exec(&block)]] }
	  end
	end
      end
    end
    before do |e|
      request=Rack::Request.new e;
      request.params.dup.map do |k,v|
	params[k.to_sym]=v
      end
    end

    $Utter.use Rack::CommonLogger  
    $Utter.use Rack::Session::Cookie; # https://gist.github.com/noahhendrix/1509698 Authenticating with Grape
    $Utter.use Rack::Lock; # simultanious requests

    def self.namespace n
      @namespace = n
    end

  end
  API = $Utter
end
