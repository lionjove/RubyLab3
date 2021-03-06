# frozen_string_literal: true

require_relative 'state_interface'
require_relative '../Logic/valera'
require_relative '../Logic/action'
require_relative '../Logic/game'
require_relative '../Logic/save_loader'
require_relative '../Logic/save_creater'

# Class for handling game logic
class GameState < StateInterface
  def initialize
    super
    @game = Game.new
    @next_state = 'GameState'
  end

  def state_name
    'GameState'
  end

  def next_state_name
    @next_state
  end

  def update
    @game.print_valera_stats

    @game.print_actions

    puts 'S - save'

    inp = gets.chop

    handle_input(inp) || @game.handle_input(inp)

    @game.game_ended? && @next_state = 'MainMenuState'
  end

  def on_state_enter(args)
    unless !args.nil?
      @game.valera.stats = args
    end
  end

  def on_state_leave
    @game.game_ended? && puts('Valera died!')
    SaveCreater.new(@game.valera.stats, "#{File.dirname(__dir__)}/../saves") unless @game.game_ended?
  end

  private

  def handle_input(inp)
    inp == 'S' && @next_state = 'MainMenuState'
  end
end
