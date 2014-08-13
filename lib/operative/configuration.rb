module Operative
  class Configuration
    attr_accessor :parallelism, :log_level, :logger

    def initialize
      @parallelism  = 5
      @log_file     = 'tmp/operative.log'
      @logger       = Logger.new(@log_file)
    end
  end
end
