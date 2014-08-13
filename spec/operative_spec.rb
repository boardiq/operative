require 'support/worker'
require 'support/obstinate'

describe Operative do
  it 'should be version 0.0.1' do
    expect(subject::VERSION).to eq("0.0.1")
  end

  context 'enqueuing' do
    it 'should respond to enqueue' do
      expect(subject).to respond_to(:enqueue)
    end

    it 'should have a queue' do
      expect(subject.queue).to be_kind_of(Operative::Queue)
    end

    it 'should enqueue a job' do
      subject.queue.clear
      subject.enqueue Worker, nil
      expect(subject.queue.backlog).to eq(1)
    end

    it 'errors unless the payload is JSONable' do
      subject.queue.clear
      expect {
        subject.enqueue Worker, Obstinate.new
      }.to raise_error
    end
  end

  context 'processors' do
    it 'delegates to the Celluloid registry' do
      expect(Celluloid::Actor).to receive(:[]).with(:processors)
      subject.processors
    end
  end

  context 'configure' do
    it 'sets up default values without a block' do
      subject.configure
      expect(subject.configuration).to be_kind_of(Operative::Configuration)
    end

    it 'sets up specific values when called with a block' do
      target = rand(100)
      subject.configure do |c|
        c.parallelism = target
      end
      expect(subject.configuration.parallelism).to eq(target)
    end
  end

end
