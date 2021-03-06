# frozen_string_literal: true

require 'FileUtils'

require_relative 'States/game_state'
require_relative 'States/main_menu_state'
require_relative 'States/game_exit_state'
require_relative 'States/save_menu_state'

# create directory for saves
FileUtils.mkdir_p("#{File.expand_path('~')}/Documents/ValeraSaves")

states = [
  MainMenuState.new,
  SaveMenuState.new,
  GameState.new,
  GameExitState.new
]

current_state = states[0]

current_state.on_state_enter('')

while current_state.state_name != 'GameExitState'
  current_state.update

  next_state_name = current_state.next_state_name

  next unless next_state_name != current_state.state_name

  args = current_state.on_state_leave

  current_state = states.find { |e| e.state_name == next_state_name }
  current_state.on_state_enter(args)
end
