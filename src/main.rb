# frozen_string_literal: true

require_relative 'States/game_state'
require_relative 'States/main_menu_state'
require_relative 'States/game_exit_state'

states = [
  MainMenuState.new,
  GameState.new,
  GameExitState.new
]

current_state = states[0]

current_state.on_state_enter

while current_state.state_name != 'GameExitState'
  current_state.update

  next_state_name = current_state.next_state_name

  next unless next_state_name != current_state.state_name

  current_state.on_state_leave

  current_state = states.find { |e| e.state_name == next_state_name }
  current_state.on_state_enter
end
