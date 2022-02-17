# frozen_string_literal: true

class A
  def initialize(b)
    @b = b
  end

  def confine(hash)
    @b.confine(hash)
  end
end

RSpec.describe A do
  let(:b) { double('b') }
  let(:subject) { A.new(b) }

  it "should delegate its confine method to its confine collection" do
    expect(b).to receive(:confine).with(:foo => :bar, :bee => :baz)
    subject.confine(:foo => :bar, :bee => :baz)
  end
end
