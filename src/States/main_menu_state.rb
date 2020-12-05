# frozen_string_literal: true

require_relative 'state_interface'

# Class for handling main menu logic
class MainMenuState < StateInterface
  def initialize
    super
    @next_state = 'MainMenuState'
    @args = ''
  end

  def state_name
    'MainMenuState'
  end

  def next_state_name
    @next_state
  end

  def update
    print_menu
    input = gets.chop

    handle_input(input)
  end

  # main menu state simply passes on arguments
  def on_state_enter(args)
    @args = args
  end

  def on_state_leave
    @args
  end

  private

  def print_menu
    puts '1. Start game'
    puts '2. Load game'
    puts '3. Exit'
  end

  def handle_input(inp)
    case inp
    when '1'
      @next_state = 'GameState'
    when '2'
      @next_state = 'SaveMenuState'
    when '3'
      @next_state = 'GameExitState'
    else
      puts 'Bad input!'
    end
  end
end
