require "minimus/version"

class Minimus

  attr_reader :states, :initial_state

  def initialize(*states)
    @states = states
    @initial_state = states.first
  end
end
