require_relative './helper'
class S < Utter::Endpoint
  get "/" do
    "hello"
#    log.info "huh"
  end
end
