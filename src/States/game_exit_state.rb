# frozen_string_literal: true

require_relative 'state_interface'

# Class for handling main menu logic
class GameExitState < StateInterface
  def state_name
    'GameExitState'
  end

  def next_state_name
    raise 'Virtual function call'
  end

  def update
    # empty
  end

  def on_state_enter(_args)
    # empty
  end

  def on_state_leave
    raise 'Virtual function call'
  end
end
