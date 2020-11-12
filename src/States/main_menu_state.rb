# frozen_string_literal: true

require_relative 'state_interface'

# Class for handling main menu logic
class MainMenuState < StateInterface
  def state_name
    'MainMenuState'
  end

  def next_state_name
    # leave for now
    'GameExitState'
  end

  def update
    # empty for now
  end

  def on_state_enter
    puts 'hello world!'
  end

  def on_state_leave
    # empty for now
  end
end
