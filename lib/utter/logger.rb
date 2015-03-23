require 'logger'
require 'stringio'

module Utter
  module Logging
    @@logger = Logger.new STDOUT 
    @@logger.datetime_format = '%Y-%m-%d %H:%M:%S'

    def log
      @@logger
    end
  end

  class Klass 
    extend Utter::Logging
  end
end
# Usage
#log.info "dd"
#log.debug "dd"
#log.warn "dd"
