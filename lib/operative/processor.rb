module Operative
  class Processor
    include Celluloid
    include Celluloid::Logger

    def process(klass, jid, job)
      info "[Processor] Job #{jid} calling #{klass} with args: #{job}"
      klass.constantize.new.perform(job)
      info "[Processor] Job #{jid} finished"
    end
  end
end
