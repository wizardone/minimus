require 'byebug'
RSpec.describe Minimus do
  it "has a version number" do
    expect(Minimus::VERSION).not_to be nil
  end

  it "accepts an array of states" do
    minimus = described_class.new(:first, :second, :third)

    expect(minimus.states).to match_array([:first, :second, :third])
    expect(minimus.initial_state).to eq(:first)
  end

  it "moves to a new state" do
    minimus = described_class.new(:first, :second, :third)
    minimus.move(:second)

    expect(minimus.current_state).to eq(:second)
  end

  it "raises an error" do
    minimus = described_class.new(:first, :second, :third)
    expect {
      minimus.move!(:third)
    }.to raise_error(Minimus::TransitionError)
  end
end
