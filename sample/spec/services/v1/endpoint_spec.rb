# Specs for the endpoint
require_relative './../../helper'
require_relative './../../../lib/services/v1/endpoint'

describe 'Endpoint' do
  
  before do
    def path url
      return `curl http://127.0.0.1:9292/api/v1/services#{url}`
    end
  end

  describe "Services::V1::Endpoint" do
    it "hi" do
      skip
      path("/hi?user=hero").must_be_kind_of Hash #"hero" #{ "hello" => "hero" } #.to_json
    end

    it "it plays pingpong" do 
      path("/ping").must_equal "pong"
    end

  end

  after do 
  end

end
