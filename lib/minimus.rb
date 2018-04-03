require_relative 'version'

class Minimus

  TransitionError = Class.new(StandardError)

  attr_reader :states, :initial_state, :possibilities
  attr_accessor :current_state

  def initialize(*states)
    @states = states
    @initial_state = states.first
    @current_state = initial_state
    @possibilities = {}
  end

  def move(new_state)
    return false unless move_possible?(new_state)
    self.current_state = new_state

    yield if block_given?
  end

  def move!(new_state)
    unless move_possible?(new_state)
      raise TransitionError, %(unallowed transition from
         #{current_state} to #{new_state})
    end
    self.current_state = new_state

    yield if block_given?
  end

  def can(state, possible:)
    possible_array = Array(possible)
    return unless possible_array.all? { |value| states.include?(value) }

    possibilities[state] = possible_array
  end

  private

  def move_possible?(new_state)
    if state_possibilities = possibilities[current_state]
      state_possibilities.include?(new_state)
    else
      states[states.index(current_state) + 1] == new_state
    end
  end
end
