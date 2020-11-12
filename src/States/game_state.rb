# frozen_string_literal: true

require_relative 'state_interface'

# Class for handling game logic
class GameState < StateInterface
  def state_name
    'GameState'
  end

  def next_state_name
    raise 'Virtual function call'
  end

  def update
    raise 'Virtual function call'
  end

  def on_state_enter
    raise 'Virtual function call'
  end

  def on_state_leave
    raise 'Virtual function call'
  end
end
