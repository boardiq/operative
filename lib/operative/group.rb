module Operative
  class Group < Celluloid::SupervisionGroup
    supervise Distributor,  as: :distributor
    pool      Processor,    as: :processors, size: Operative.configuration.parallelism
  end
end
