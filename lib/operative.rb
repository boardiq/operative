require 'json'
require 'celluloid'
require 'logger'
require 'active_support/inflector'
require 'securerandom'
require 'operative/version'

module Operative

  autoload :Configuration,  'operative/configuration'
  autoload :Distributor,    'operative/distributor'
  autoload :Group,          'operative/group'
  autoload :Processor,      'operative/processor'
  autoload :Queue,          'operative/queue'

  class << self
    attr_accessor :configuration, :running

    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end

    def enqueue(klass, payload)
      raise ArgumentError unless payload.respond_to?(:to_json)
      jid = SecureRandom.uuid
      queue.push [klass.to_s, jid, payload.to_json]
      jid
    end

    def queue
      @queue ||= Queue.new
    end

    def processors
      Celluloid::Actor[:processors]
    end

    def start
      unless running
        configure unless configuration
        @running = true
        Celluloid.logger = configuration.logger
        Group.run!
        Celluloid::Actor[:distributor].async.process
        true
      end
    end

    def shutdown()
      @running = false
      enqueue '__Shutdown__', nil
    end
  end
end
