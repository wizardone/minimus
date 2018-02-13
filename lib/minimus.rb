require_relative 'version'

class Minimus

  attr_reader :states, :initial_state, :current_state

  def initialize(*states)
    @states = states
    @initial_state = states.first
  end
end
