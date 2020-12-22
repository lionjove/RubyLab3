# frozen_string_literal: true

require_relative 'state_interface'
require_relative '../Logic/save_loader'

# Class for handling main menu logic
class SaveMenuState < StateInterface
  def initialize
    @iter = 1
    @save_num = -1
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
    @save_loader = SaveLoader.new("#{File.dirname(__dir__)}/../saves")
  end

  def on_state_leave
    return @save_loader.saves[@save_num].stats if @save_num != -1
  end

  private

  def print_menu
    @iter = 1
    @save_loader.saves.each do |save|
      puts("#{@iter}. #{save.name}")
      @iter += 1
    end
    puts("#{@iter}. Main menu")
    @iter += 1
    puts("#{@iter}. Exit")
  end

  def handle_input(inp)
    case inp
    when (@iter - 1).to_s
      @next_state = 'MainMenuState'
    when @iter.to_s
      @next_state = 'GameExitState'
    else
      if inp.to_i.positive? && inp.to_i < @iter - 1
        @next_state = 'GameState'
        @save_num = inp.to_i - 1
      else
        puts 'Bad input!'
      end
    end
  end
end
