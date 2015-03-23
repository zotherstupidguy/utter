require_relative './utter/logger'
require_relative './utter/ds'
require_relative './utter/api'
=begin
module Utter
  def self.gem_version
    Gem::Version.new VERSION::STRING
  end
  module VERSION
    MAJOR = 1
    MINOR = 0
    TINY = 0 
    PRE = "alpha"
    STRING = [MAJOR, MINOR, TINY, PRE].compact.join
  end
end
=end
