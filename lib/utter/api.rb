# No code is faster than no code.
require 'rack' 
require 'json' 
require './persistent'

module Utter

  class Builder < Rack::Builder

  end

  def self.helpers *ext
    Utter::Builder.send :include, *ext if ext.any?
  end

  class Endpoint 

    $Utter = Utter::Builder.new
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

	  full = '/' + @prefix.to_s + @version.to_s + @namespace.to_s + path

	  $Utter.map(full) do
	    puts "Ready: #{full}"
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

    
    def self.prefix v 
      if !v.nil?
	@prefix = v.to_s + '/'
      else
	nil
      end
    end

    def self.version v
      if !v.nil?
	@version = v.to_s  + '/'
      else
	nil
      end
    end

    def self.namespace v
      if !v.nil?
	@namespace = v.to_s #+ '/'
      else
	nil
      end
    end

  end

  Endpoints = $Utter
end
