module Operative
  class Distributor
    include Celluloid
    include Celluloid::Logger

    def process
      info '[Distributor] Starting to process...'
      loop do
        job = Operative.queue.pop
        info "[Distributor] Found job for #{job.first}"
        break if job.first == '__Shutdown__'
        Operative.processors.process *job
      end if Operative.running
      info '[Distributor] Shutting down...'
    end
  end
end
