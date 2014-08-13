require 'thread'

module Operative
  class Queue
    def initialize
      @queue = ::Queue.new
    end

    def pop
      @queue.pop
    end

    def push(obj)
      @queue.push(obj)
    end

    def backlog
      @queue.length
    end

    def clear
      @queue.clear
    end

    def empty?
      @queue.empty?
    end
  end
end
