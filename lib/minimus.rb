require_relative 'version'

class Minimus

  TransitionError = Class.new(StandardError)

  attr_reader :states, :initial_state
  attr_accessor :current_state

  def initialize(*states)
    @states = states
    @initial_state = states.first
    @current_state = initial_state
  end

  def move(new_state)
    self.current_state = new_state
  end

  def move!(new_state)
    raise TransitionError, "unallowed transition from #{current_state} to #{new_state}"
    self.current_state = new_state
  end
end
