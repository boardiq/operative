describe Operative::Queue do
  it 'should respond to pop' do
    expect(subject).to respond_to(:pop)
  end

  it 'should respond to push' do
    expect(subject).to respond_to(:push)
  end

  it 'should respond to backlog' do
    expect(subject).to respond_to(:backlog)
  end

  it 'should respond to clear' do
    expect(subject).to respond_to(:clear)
  end

  it 'should respond to empty?' do
    expect(subject).to respond_to(:empty?)
  end

  context 'working with elements' do
    let(:items) { ('A'..'Z').to_a }
    before :each do
      items.each { |i| subject.push(i) }
    end

    it 'stores the correct number of elements' do
      expect(subject.backlog).to eq(items.length)
    end

    it 'stores elements in order' do
      while i = items.shift do
        expect(subject.pop).to eq(i)
      end
    end

    it 'removes elements on clear' do
      subject.clear
      expect(subject.backlog).to eq 0
      expect(subject.empty?).to eq true
    end
  end
end
