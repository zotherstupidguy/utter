# 
# Utter Builder
#
require 'rack' 

module Utter
  class Builder < Rack::Builder; end

  def self.helpers *ext
    Utter::Builder.send :include, *ext if ext.any?
  end
end
