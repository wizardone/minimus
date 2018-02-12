RSpec.describe Minimus do
  it "has a version number" do
    expect(Minimus::VERSION).not_to be nil
  end

  it "accepts an array of states" do
    minimus = described_class.new(:first, :second, :third)

    expect(minimus.states).to match_array([:first, :second, :third])
    expect(minimus.initial_state).to eq(:first)
  end
end
