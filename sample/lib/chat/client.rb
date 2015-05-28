#!/usr/bin/env ruby -w

require "socket"
require_relative "window"

class Client

  def self.start(handle)
    client = Client.new(handle)
    window = Window.new(client)

    window.start
  end

  def initialize( server )
    @server = server
    @request = nil
    @response = nil
    listen
    send
    @request.join
    @response.join
  end
 
  def listen
    @response = Thread.new do
      loop {
        msg = @server.gets.chomp
        puts "#{msg}"
      }
    end
  end
 
  def send
    puts "Enter the username:"
    @request = Thread.new do
      loop {
        msg = $stdin.gets.chomp
        @server.puts( msg )
      }
    end
  end
end
 
server = TCPSocket.open( 'localhost', 3000)
Client.new( server )
