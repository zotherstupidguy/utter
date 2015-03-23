require 'utter/api' 
require 'utter/api' 

module Utter

  # Returns the version of the currently loaded Utter as a <tt>Gem::Version</tt>
  def self.gem_version                                                                                                                                
    Gem::Version.new VERSION::STRING
  end

  module VERSION                                                                                                                                      
    MAJOR = 1 
    MINOR = 0 
    TINY  = 0                                                                                                                                         
    PRE   = "alpha"
    STRING = [MAJOR, MINOR, TINY, PRE].compact.join
  end 
end
