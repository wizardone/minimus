RSpec.describe Minimus do
  it "has a version number" do
    expect(Minimus::VERSION).not_to be nil
  end

  let(:minimus) { described_class.new(:first, :second, :third) }

  it 'has a hash of possible state changes' do
    expect(minimus.possibilities).to eq({})
  end

  it 'accepts an array of states' do
    expect(minimus.states).to match_array([:first, :second, :third])
    expect(minimus.initial_state).to eq(:first)
  end

  it 'moves to a new state if possible' do
    minimus.move(:second)

    expect(minimus.current_state).to eq(:second)
  end

  it 'calls the callback if given' do
    _object = Object.new
    _object.instance_eval do
      def custom_callback
        "TEST"
      end
    end

    expect(_object).to receive(:custom_callback)

    minimus.move(:second) do
      _object.custom_callback
    end
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
