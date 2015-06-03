require_relative './../helper'
require 'net/http'

class S < Utter::Endpoint
  get "/" do
    "hello"
  end
end
run Utter::Endpoints

describe 'Utter API' do 
  before  do 
    uri = URI('http://127.0.0.1:8080')
    #params = { :limit => 10, :page => 3 }
    #uri.query = URI.encode_www_form(params)
    @res = Net::HTTP.get_response(uri)
  end

  it "assert somthing" do 
    @res.body.must_equal nil #Net::HTTPSuccess
  end

end
