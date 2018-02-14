require 'byebug'
RSpec.describe Minimus do
  it "has a version number" do
    expect(Minimus::VERSION).not_to be nil
  end

  let(:minimus) { described_class.new(:first, :second, :third) }
  it "accepts an array of states" do
    expect(minimus.states).to match_array([:first, :second, :third])
    expect(minimus.initial_state).to eq(:first)
  end

  it "moves to a new state if possible" do
    minimus.move(:second)

    expect(minimus.current_state).to eq(:second)
  end

  it "returns false if move to new state is not possible" do
    expect(minimus.move(:third)).to be false
    expect(minimus.current_state).to eq(:first)
  end

  it "raises an error if move to new state is not possible" do
    expect {
      minimus.move!(:third)
    }.to raise_error(Minimus::TransitionError)
  end
end
