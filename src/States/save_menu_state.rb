# frozen_string_literal: true

require_relative 'state_interface'
require_relative '../Logic/save_loader'

# Class for handling main menu logic
class SaveMenuState < StateInterface
  def initialize
    @iter = 1
    super
    @next_state = 'SaveMenuState'
  end

  def state_name
    'SaveMenuState'
  end

  def next_state_name
    @next_state
  end

  def update
    print_menu
    input = gets.chop

    handle_input(input)
  end

  def on_state_enter(_args)
    @save_loader = SaveLoader.new(File.dirname(__dir__) + '/../saves')
  end

  def on_state_leave
    # empty for now
  end

  private

  def print_menu
    @iter = 1
    for save in @save_loader.saves
      puts (@iter.to_s + '. ' + save.name)
      @iter += 1
    end
    puts (@iter.to_s + '. Main menu')
    @iter += 1
    puts (@iter.to_s + '. Exit')
  end

  def handle_input(inp)
    case inp
    when "#{@iter - 1}"
      @next_state = 'MainMenuState'
    when "#{@iter}" 
      @next_state = 'GameExitState'
    else
      puts 'Bad input!'
    end
  end
end
