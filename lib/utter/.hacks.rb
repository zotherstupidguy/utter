#It's just amazing. No code is faster than no code.
['rack', 'date', 'INT', 'TERM', 'json'].map do |l|
  trap(l) do
    $r.stop
  end rescue require l
end
$port=4567

puts "uttering on :#$port"

# The main logic
$n=Module.new; 
$n.extend Rack;

a = Rack::Builder.new
D = Object.method(:define_method)
q = nil

%w{get post put delete}.map do |method|
  define_method(method) do |path, &block|
    a.map(path) do
      run ->(e) { [200, {"Content-Type" => "application/json"}, [a.instance_eval(&block)]] }
    end
  end
end

%w[set enable disable configure helpers use register].map{|m|D.(m){|*_,&b|b.try :[]}};
#%w[set enable disable configure helpers use register].map do |method|
#  define_method(method) do |*_,&block|
#	block.try :[] 
#  end
#end


%w[params session].map{|m|D.(m){q.send m}};

a.use Rack::Session::Cookie; # https://gist.github.com/noahhendrix/1509698 Authenticating with Grape
a.use Rack::Lock; # simultanious requests
D.(:before){|&b|a.use Rack::Config,&b};

before{|e|q=Rack::Request.new e; q.params.dup.map{ |k,v| params[k.to_sym]=v}} 


class MyApp  
  get '/' do 
    {:hello => "goodbye"}.to_json
  end
  get '/bad' do 
    "really bad boy"
  end
  # /hello?name=world
  get '/hello' do
    { name: params[:name] }.to_json
  end
end


a.map('/') { run MyApp }

END{Rack::Handler.get("webrick").run(a,Port:$port){|s|$r=s}}



=begin
  q = nil  
  %w[params session].map do |m|
    define_method(m)do 
      q.send m
    end
  end

  define_method(:before){|&b|$Utter.use Rack::Config,&b};
  before{|e|q=Rack::Request.new e; q.params.dup.map{ |k,v| params[k.to_sym]=v}} 
=end 

=begin
    %w{resource}.map do |method|
      define_method(method) do |path, &block|
	$Utter.map(path) do
	  $Utter.instance_exec(&block)
	end
      end
    end

    def self.nest(*blocks, &block)
      require 'rack'
      blocks.reject!(&:nil?)
      if blocks.any?
	instance_eval(&block) if block_given?
	blocks.each do |b| 
	  #instance_eval(&b) 
	  app = Rack::Builder.app do
	    run ->(e) { [200, {"Content-Type" => "application/json"}, [$Utter.instance_exec(&b)]] }
	  end
	end
	#reset_validations!
      else
	run ->(e) { [200, {"Content-Type" => "application/json"}, [$Utter.instance_exec(&block)]] }
	#$Utter.instance_eval(&block)
      end
    end
=end



=begin
  %w{r}.map do |method|
    define_method(method) do |path, &block|

      $Utter.instance_exec(&block)

      #$Utter.map('/inner') { run InnerApp.new }
      #$Utter.map(path) do
      #	$Utter.instance_exec(&block)
      #end
    end
  end
=end
